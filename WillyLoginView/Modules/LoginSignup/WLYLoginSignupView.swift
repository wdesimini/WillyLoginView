//
//  WLYLoginSignupView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 9/30/21.
//

import SwiftUI

struct WLYLoginSignupView: View {
    @State var showingLogin = true
    var viewModel: WLYLoginSignupViewModel
    
    var body: some View {
        VStack {
            WLYSwitch(
                leftTitle: "Sign up",
                right: $showingLogin,
                rightTitle: "Log in"
            )
            Spacer()
            if showingLogin {
                WLYLoginView(viewModel: viewModel.loginViewModel)
            } else {
                WLYSignupView(viewModel: viewModel.signupViewModel)
            }
        }
    }
}

struct WLYLoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        let loginService = WLYLoginServiceSample()
        let signupService = WLYSignupServiceSample()
        let viewModel = WLYLoginSignupViewModel(
            loginService: loginService,
            signupService: signupService
        )
        return WLYLoginSignupView(viewModel: viewModel)
    }
}
