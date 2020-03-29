//
//  LoginResource.swift
//  IntroTo_MVVM
//
//  Created by MACBOOK on 29/03/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import Foundation

struct LoginResource {
    
    func LoginUser(loginRequest: LoginRequest, completion: @escaping(_ result: LoginResponse) -> Void) {
        let loginUrl = URL(string: APIHelper.login)!
        let httpUtility = HttpUtility()
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postApiData(requestUrl: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self) { (response) in
                _ = completion(response)
            }
        }
        catch let error {
            print(error)
        }
    }
}
