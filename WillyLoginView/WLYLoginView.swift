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
            VStack(alignment: .leading) {
                Text("Username")
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading) {
                HStack {
                    Text("Password")
                    Spacer()
                    Button("Forgot Password?", action: forgotPasswordTapped)
                }
                
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
            Button("Log in", action: loginTapped)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(4)
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
