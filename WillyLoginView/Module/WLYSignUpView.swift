//
//  WLYSignUpView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/4/21.
//

import SwiftUI

struct WLYSignUpCredentials {
    var agreeToTerms = false
    var email = ""
    var password = ""
    var username = ""
}

protocol WLYSignUpViewDelegate {
    typealias Handler = (Error?) -> Void
    func signUp(credentials: WLYSignUpCredentials, completion: @escaping Handler)
}

struct WLYSignUpViewDelegateSample: WLYSignUpViewDelegate {
    func signUp(credentials: WLYSignUpCredentials, completion: @escaping Handler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(nil)
        }
    }
}

struct WLYSignUpView: View {
    @State var credentials = WLYSignUpCredentials()
    let delegate: WLYSignUpViewDelegate
    @State var signingUp = false
    
    var body: some View {
        if signingUp {
            VStack {
                Text("Signing up")
                ProgressView()
            }
        } else {
            VStack(alignment: .leading, spacing: 32) {
                Text("Let's get started")
                    .textStyle(WLYTitleTextStyle())
                TextField("Email", text: $credentials.email)
                    .textFieldStyle(TextFieldStyleTitled(title: "Email"))
                TextField("Username", text: $credentials.username)
                    .textFieldStyle(TextFieldStyleTitled(title: "Username"))
                TextField("8 characters, uppercase", text: $credentials.password)
                    .textFieldStyle(TextFieldStyleTitled(title: "Password"))
                Spacer()
                VStack {
                    WLYCheckbox(
                        checked: $credentials.agreeToTerms,
                        text: "By creating an account, you agree to the terms of service and our privacy policy"
                    )
                    Button("Sign up", action: signUpTapped)
                        .buttonStyle(ButtonStyleWLYProminent())
                }
            }
            .padding()
        }
    }
    
    private func signUpTapped() {
        delegate.signUp(credentials: credentials) { error in
        }
    }
}

struct WLYSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let delegate = WLYSignUpViewDelegateSample()
        return WLYSignUpView(delegate: delegate)
    }
}
