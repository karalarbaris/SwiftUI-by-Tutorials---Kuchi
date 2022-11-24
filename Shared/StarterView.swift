//
//  File.swift
//  Kuchi
//
//  Created by Baris Karalar on 15.11.22.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var userViewModel: UserManager
        
    @ViewBuilder
    var body: some View {
        if userViewModel.isRegistered {
            WelcomeView()
        } else {
            RegisterView()
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
