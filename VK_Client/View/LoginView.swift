//
//  LoginView.swift
//  VK_Client
//
//  Created by Вячеслав on 19.02.2023.
//

import SwiftUI
import Combine

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        if loginViewModel.isLogin {
            AppView()
                .environmentObject(loginViewModel)
        } else {
            WebPageView(token: $loginViewModel.token)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
