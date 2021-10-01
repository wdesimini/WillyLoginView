//
//  WLYLoginSignupView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 9/30/21.
//

import SwiftUI

struct WLYLoginSignupView: View {
    @State var showingLogin = true
    
    var body: some View {
        VStack {
            WLYSwitch(
                leftTitle: "Sign up",
                right: $showingLogin,
                rightTitle: "Log in"
            )
            Spacer()
            if showingLogin {
                WLYLoginView()
            } else {
                WLYSignupView()
            }
        }
    }
    
    private func logInTapped() {
    }
    
    private func signUpTapped() {
    }
}

struct WLYLoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        WLYLoginSignupView()
    }
}
