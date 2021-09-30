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
            HStack {
                Button("Sign up", action: logInTapped)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(showingLogin ? .body : .headline)
                    .opacity(showingLogin ? 0.5 : 1)
                Button("Log in", action: signUpTapped)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(showingLogin ? .headline : .body)
                    .opacity(showingLogin ? 1 : 0.5)
            }
            .foregroundColor(.black)
            WLYLoginView()
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
