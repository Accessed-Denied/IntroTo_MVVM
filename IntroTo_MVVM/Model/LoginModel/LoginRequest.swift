//
//  LoginModel.swift
//  IntroTo_MVVM
//
//  Created by MACBOOK on 29/03/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

struct LoginRequest: Encodable {
    var email, password: String?
}
