//
//  WelcomeView.swift
//  Kuchi
//
//  Created by Baris Karalar on 15.11.22.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var userManager: UserManager
    @State var showPractice = false
    
    var body: some View {
        
        if showPractice {
            HomeView()
        } else {
            ZStack {
                WelcomeBackgroundImage()
                VStack {
                    Text(verbatim: "Hi, \(userManager.profile.name)")
                    
                    WelcomeMessageView()
                    
                    Button {
                        self.showPractice = true
                    } label: {
                        HStack {
                            Image(systemName: "play")
                            Text(verbatim: "Start")
                        }
                    }

                }
            }
        }
        

        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(UserManager())
    }
}
