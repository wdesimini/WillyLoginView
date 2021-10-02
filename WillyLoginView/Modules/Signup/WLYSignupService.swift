//
//  WLYSignupService.swift
//  WillyLoginView
//
//  Created by Desimini, Wilson on 10/1/21.
//

import Foundation

protocol WLYSignupService {
    typealias Result = Swift.Result<Bool, Error>
    typealias Handler = (Result) -> Void
    func signUp(
        agreedToTerms: Bool,
        email: String,
        username: String,
        password: String,
        completion: @escaping Handler
    )
}
