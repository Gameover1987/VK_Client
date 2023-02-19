//
//  VK_ClientApp.swift
//  VK_Client
//
//  Created by Вячеслав on 19.02.2023.
//

import SwiftUI

@main
struct VK_ClientApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView().ignoresSafeArea(.all)
        }
    }
}
