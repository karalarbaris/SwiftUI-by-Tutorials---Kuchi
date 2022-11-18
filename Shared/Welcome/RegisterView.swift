//
//  RegisterView.swift
//  Kuchi
//
//  Created by Baris Karalar on 16.11.22.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userManager: UserManager
    @FocusState var nameFieldFocused: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                WelcomeMessageView()
                
                TextField("Type your name:", text: $userManager.profile.name)
                    .focused($nameFieldFocused)
                    .submitLabel(.done)
                    .onSubmit(registerUser)
                    .bordered()
                
                HStack {
                    Spacer()
                    Text("\(userManager.profile.name.count)")
                        .font(.caption)
                        .foregroundColor(userManager.isUserNameValid() ? .green : .red)
                        .padding(.trailing)
                }
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    
                    Toggle(isOn: $userManager.settings.rememberUser) {
                        Text("Remember me")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .fixedSize()
                }
                
                
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 16, height: 16, alignment: .center)
                        Text("Ok")
                            .font(.body)
                            .bold()
                            .disabled(!userManager.isUserNameValid())
                    }
                }
                .bordered()
                
                Spacer()
            }
            .padding()
            .background(WelcomeBackgroundImage())
        }
    }
}

// MARK: - Event Handlers
extension RegisterView {
    func registerUser() {
        
        nameFieldFocused = false
        
        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }
        
        userManager.persistSettings()
        userManager.setRegistered()
        nameFieldFocused = false
        print("ddd")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static let user = UserManager(name: "Baris")
    
    static var previews: some View {
        RegisterView()
            .environmentObject(user)
    }
}
