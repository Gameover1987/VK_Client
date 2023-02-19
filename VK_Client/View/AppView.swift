//
//  AppView.swift
//  VK_Client
//
//  Created by Вячеслав on 19.02.2023.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        Text(loginViewModel.token)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
