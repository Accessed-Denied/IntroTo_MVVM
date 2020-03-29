//
//  LoginViewModel.swift
//  IntroTo_MVVM
//
//  Created by MACBOOK on 29/03/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate {
    func DidRecieveLoginResponse(loginResponse: LoginResponse?)
}

struct LoginViewModel {
    var delegate: LoginViewModelDelegate?
    
    func LoginUser(loginRequest: LoginRequest) {
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)
        if(validationResult.success) {
            let loginResource = LoginResource()
            loginResource.LoginUser(loginRequest: loginRequest) { (response) in
                DispatchQueue.main.async {
                    self.delegate?.DidRecieveLoginResponse(loginResponse: response)
                }
            }
            
        }
        self.delegate?.DidRecieveLoginResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
    }
}
