//
//  WLYLoginView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 9/30/21.
//

import SwiftUI

struct WLYLoginView: View {
    @State var rememberDevice = false
    @State var password = ""
    @State var username = ""
    @ObservedObject var viewModel: WLYLoginViewModel
    
    var body: some View {
        if let logInError = viewModel.error {
            Text("Error logging in - \(logInError.localizedDescription)")
        } else if let loggedIn = viewModel.loggedIn {
            Text(loggedIn ? "Logged in!" : "Couldn't log in!")
        } else if viewModel.isLoggingIn {
            VStack {
                Text("Logging in")
                ProgressView()
            }
        } else {
            VStack(alignment: .leading, spacing: 32) {
                Text("Welcome back")
                    .textStyle(WLYTitleTextStyle())
                WLYTitledTextField(
                    detailButtonModel: nil,
                    placeholder: "Username",
                    title: "Username",
                    text: $username
                )
                VStack(alignment: .leading) {
                    WLYTitledTextField(
                        detailButtonModel: WLYDetailButtonModel(
                            title: "Forgot Password?",
                            action: forgotPasswordTapped
                        ),
                        placeholder: "Password",
                        title: "Password",
                        text: $password
                    )
                    WLYCheckbox(
                        checked: $rememberDevice,
                        text: "Remember this device"
                    )
                }
                Spacer()
                Button("Log in", action: loginTapped)
                    .buttonStyle(WLYProminentButtonStyle())
            }
            .padding()
        }
    }
    
    private func forgotPasswordTapped() {
    }
    
    private func loginTapped() {
        viewModel.logIn(username: username, password: password)
    }
}

struct WLYLoginView_Previews: PreviewProvider {
    static var previews: some View {
        let service = WLYLoginServiceSample()
        let viewModel = WLYLoginViewModel()
        viewModel.service = service
        return WLYLoginView(viewModel: viewModel)
    }
}

struct WLYLoginServiceSample: WLYLoginService {
    func logIn(username: String, password: String, completion: @escaping Handler) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion(.success(true))
        }
    }
}
