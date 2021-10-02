//
//  WLYSignupViewModel.swift
//  WillyLoginView
//
//  Created by Desimini, Wilson on 10/1/21.
//

import SwiftUI

class WLYSignupViewModel: ObservableObject {
    @Published var signingUp = false
    @Published var signUpError: Error?
    @Published var signUpResult: Bool?
    private let service: WLYSignupService
    
    init(service: WLYSignupService) {
        self.service = service
    }
    
    private func didReceive(signUpResult: WLYSignupService.Result) {
        do {
            self.signUpResult = try signUpResult.get()
        } catch {
            signUpError = error
        }
        signingUp = false
    }
    
    func signUp(
        agreedToTerms: Bool,
        email: String,
        username: String,
        password: String
    ) {
        signingUp = true
        service.signUp(
            agreedToTerms: agreedToTerms,
            email: email,
            username: username,
            password: password
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.didReceive(signUpResult: result)
            }
        }
    }
}
