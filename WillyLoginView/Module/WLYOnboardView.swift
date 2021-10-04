//
//  WLYOnboardView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/4/21.
//

import SwiftUI

struct WLYOnboardView: View {
    let logInDelegate: WLYLogInViewDelegate
    let signUpDelegate: WLYSignUpViewDelegate
    @State var showingLogin = true
    
    var body: some View {
        VStack {
            HStack {
                Button("Sign up") { showingLogin = false }
                    .buttonStyle(ButtonStyleWLYUnderlinedSelectable(selected: !showingLogin))
                Button("Log in") { showingLogin = true }
                    .buttonStyle(ButtonStyleWLYUnderlinedSelectable(selected: showingLogin))
            }
            Spacer()
            if showingLogin {
                WLYLogInView(delegate: logInDelegate)
            } else {
                WLYSignUpView(delegate: signUpDelegate)
            }
        }
    }
}

struct WLYOnboardView_Previews: PreviewProvider {
    static var previews: some View {
        let logInDelegate = WLYLogInViewDelegateSample()
        let signUpDelegate = WLYSignUpViewDelegateSample()
        return WLYOnboardView(
            logInDelegate: logInDelegate,
            signUpDelegate: signUpDelegate
        )
    }
}
