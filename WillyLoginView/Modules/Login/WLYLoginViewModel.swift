//
//  WLYLoginViewModel.swift
//  WillyLoginView
//
//  Created by Desimini, Wilson on 10/1/21.
//

import SwiftUI

class WLYLoginViewModel: ObservableObject {
    @Published var error: Error?
    @Published var isLoggingIn = false
    @Published var loggedIn: Bool?
    private let service: WLYLoginService
    
    init(service: WLYLoginService) {
        self.service = service
    }
    
    private func didReceive(logInResult: WLYLoginService.Result) {
        do {
            loggedIn = try logInResult.get()
        } catch {
            self.error = error
        }
        isLoggingIn = false
    }
    
    func logIn(username: String, password: String) {
        isLoggingIn = true
        
        service.logIn(
            username: username,
            password: password
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.didReceive(logInResult: result)
            }
        }
    }
}
