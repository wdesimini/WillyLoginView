//
//  WLYLoginService.swift
//  WillyLoginView
//
//  Created by Desimini, Wilson on 10/1/21.
//

import Foundation

protocol WLYLoginService {
    typealias Result = Swift.Result<Bool, Error>
    typealias Handler = (Result) -> Void
    func logIn(username: String, password: String, completion: @escaping Handler)
}
