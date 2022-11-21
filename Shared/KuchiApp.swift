//
//  File.swift
//  Kuchi
//
//  Created by Baris Karalar on 15.11.22.
//

import SwiftUI

@main
struct KuchiApp: App {
    let userManager = UserManager()
    
    init() {
        userManager.load()
    }
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}

//struct KuchiApp_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView()
//    }
//}
