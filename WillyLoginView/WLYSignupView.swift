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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Spacer()
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
    
    private func signUpTapped() {
    }
}

struct WLYSignupView_Previews: PreviewProvider {
    static var previews: some View {
        WLYSignupView()
    }
}
