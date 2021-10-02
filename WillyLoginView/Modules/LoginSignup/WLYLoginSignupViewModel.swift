//
//  WLYLoginSignupViewModel.swift
//  WillyLoginView
//
//  Created by Desimini, Wilson on 10/1/21.
//

import Foundation

struct WLYLoginSignupViewModel {
    let loginService: WLYLoginServiceSample
    let signupService: WLYSignupServiceSample
    
    var loginViewModel: WLYLoginViewModel {
        WLYLoginViewModel(service: loginService)
    }
    
    var signupViewModel: WLYSignupViewModel {
        WLYSignupViewModel(service: signupService)
    }
}
