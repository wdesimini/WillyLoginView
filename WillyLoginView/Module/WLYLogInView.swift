//
//  WLYLogInView.swift
//  WillyLoginView
//
//  Created by Wilson Desimini on 10/3/21.
//

import SwiftUI

struct WLYLogInCredentials {
    var password = ""
    var username = ""
}

protocol WLYLogInViewDelegate {
    typealias Handler = (Error?) -> Void
    func logIn(credentials: WLYLogInCredentials, completion: @escaping Handler)
}

struct WLYLogInViewDelegateSample: WLYLogInViewDelegate {
    func logIn(credentials: WLYLogInCredentials, completion: @escaping Handler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(nil)
        }
    }
}

struct WLYLogInView: View {
    @State private var credentials = WLYLogInCredentials()
    let delegate: WLYLogInViewDelegate
    @State var loading = false
    @State var rememberDevice = false
    
    var body: some View {
        if loading {
            VStack {
                Text("Logging in")
                ProgressView()
            }
        } else {
            VStack(alignment: .leading, spacing: 32) {
                Text("Welcome back")
                    .textStyle(WLYTitleTextStyle())
                TextField("Username", text: $credentials.username)
                    .textFieldStyle(TextFieldStyleTitled(title: "Username"))
                VStack(alignment: .leading) {
                    TextField("Password", text: $credentials.password)
                        .textFieldStyle(TextFieldStyleTitled(title: "Password"))
                    WLYCheckbox(checked: $rememberDevice, text: "Remember this device")
                }
                Spacer()
                Button("Log in", action: logInTapped)
                    .buttonStyle(ButtonStyleWLYProminent())
            }
            .padding()
        }
    }
    
    private func logInTapped() {
        loading = true
        
        delegate.logIn(credentials: credentials) { error in
            loading = false
        }
    }
}

struct WLYLoginView_Previews: PreviewProvider {
    static var previews: some View {
        let delegate = WLYLogInViewDelegateSample()
        return WLYLogInView(delegate: delegate)
    }
}
