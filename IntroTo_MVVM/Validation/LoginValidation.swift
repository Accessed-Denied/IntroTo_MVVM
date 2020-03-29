//
//  LoginValidation.swift
//  IntroTo_MVVM
//
//  Created by MACBOOK on 29/03/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

struct LoginValidation {
    func Validate(loginRequest: LoginRequest) -> ValidationResult {
        if(loginRequest.email!.isEmpty) {
            return ValidationResult(success: false, error: "User email is empty")
        }
        if(loginRequest.password!.isEmpty) {
            return ValidationResult(success: false, error: "User password is empty")
        }
        return ValidationResult(success: true, error: nil)
    }
}
