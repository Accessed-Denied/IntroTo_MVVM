//
//  LoginVC.swift
//  IntroTo_MVVM
//
//  Created by MACBOOK on 29/03/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, LoginViewModelDelegate {
    
    private var loginViewModel = LoginViewModel()
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigUI()
        loginViewModel.delegate = self
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ConfigUI
    private func ConfigUI() {
        loginBtn.layer.cornerRadius = loginBtn.frame.height / 2
    }
    
    //MARK: - loginBtnIsTapped
    @IBAction func loginBtnIsTapped(_ sender: UIButton) {
        let request = LoginRequest(email: emailTextfield.text, password: passwordTextfield.text)
        loginViewModel.LoginUser(loginRequest: request)
    }
    
    
    func DidRecieveLoginResponse(loginResponse: LoginResponse?) {
        //print(loginResponse)
        if(loginResponse?.errorMessage == nil && loginResponse?.data != nil){
            print("Navigate to different VC")
        }
        else if (loginResponse?.errorMessage != nil) {
            let alert = UIAlertController(title: "Error", message: loginResponse?.errorMessage, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
