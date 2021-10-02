//
//  WLYSignupView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/1/21.
//

import SwiftUI

struct WLYSignupView: View {
    @State var agreeToTerms = false
    @State var email = ""
    @State var password = ""
    @State var username = ""
    @ObservedObject var viewModel: WLYSignupViewModel
    
    var body: some View {
        if let signedUp = viewModel.signUpResult {
            Text(signedUp ? "Signed up!" : "Couldn't sign up!")
        } else if let signUpError = viewModel.signUpError {
            Text("Error logging in - \(signUpError.localizedDescription)")
        } else if viewModel.signingUp {
            VStack {
                Text("Signing up")
                ProgressView()
            }
        } else {
            VStack(alignment: .leading, spacing: 32) {
                Text("Let's get started")
                    .textStyle(WLYTitleTextStyle())
                WLYTitledTextField(
                    detailButtonModel: nil,
                    placeholder: "Email",
                    title: "Email",
                    text: $email
                )
                WLYTitledTextField(
                    detailButtonModel: nil,
                    placeholder: "Username",
                    title: "Username",
                    text: $username
                )
                WLYTitledTextField(
                    detailButtonModel: nil,
                    placeholder: "8 characters, uppercase",
                    title: "Password",
                    text: $password
                )
                Spacer()
                VStack {
                    WLYCheckbox(
                        checked: $agreeToTerms,
                        text: "By creating an account, you agree to the terms of service and our privacy policy"
                    )
                    Button("Sign up", action: signUpTapped)
                        .buttonStyle(WLYProminentButtonStyle())
                }
            }
            .padding()
        }
    }
    
    private func signUpTapped() {
        viewModel.signUp(
            agreedToTerms: agreeToTerms,
            email: email,
            username: username,
            password: password
        )
    }
}

struct WLYSignupView_Previews: PreviewProvider {
    static var previews: some View {
        let service = WLYSignupServiceSample()
        let viewModel = WLYSignupViewModel(service: service)
        return WLYSignupView(viewModel: viewModel)
    }
}

struct WLYSignupServiceSample: WLYSignupService {
    func signUp(
        agreedToTerms: Bool,
        email: String,
        username: String,
        password: String,
        completion: @escaping Handler
    ) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion(.success(true))
        }
    }
}
