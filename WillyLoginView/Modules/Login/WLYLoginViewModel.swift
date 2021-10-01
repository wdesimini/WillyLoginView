//
//  WLYLoginViewModel.swift
//  WillyLoginView
//
//  Created by Desimini, Wilson on 10/1/21.
//

import SwiftUI

protocol WLYLoginService {
    typealias Result = Swift.Result<Bool, Error>
    typealias Handler = (Result) -> Void
    func logIn(username: String, password: String, completion: @escaping Handler)
}

class WLYLoginViewModel: ObservableObject {
    @Published var error: Error?
    @Published var isLoggingIn = false
    @Published var loggedIn: Bool?
    var service: WLYLoginService!
    
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
