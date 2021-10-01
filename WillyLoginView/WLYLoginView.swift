//
//  WLYLoginView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 9/30/21.
//

import SwiftUI

struct WLYLoginView: View {
    @State var password = ""
    @State var username = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            Spacer()
            Text("Welcome back")
                .font(.title)
                .bold()
                .padding(.vertical)
            WLYTitledTextField(
                detailButtonModel: nil,
                placeholder: "Username",
                title: "Username",
                text: $username
            )
            WLYTitledTextField(
                detailButtonModel: WLYDetailButtonModel(
                    title: "Forgot Password?",
                    action: forgotPasswordTapped
                ),
                placeholder: "Password",
                title: "Password",
                text: $password
            )
            Spacer()
            Button("Log in", action: loginTapped)
                .buttonStyle(WLYProminentButtonStyle())
        }
        .padding()
    }
    
    private func forgotPasswordTapped() {
    }
    
    private func loginTapped() {
    }
}

struct WLYLoginView_Previews: PreviewProvider {
    static var previews: some View {
        WLYLoginView()
    }
}
