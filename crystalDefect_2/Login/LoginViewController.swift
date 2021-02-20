//
//  LoginViewController.swift
//  crystalDefect_2
//
//  Created by 이하연 on 2021/02/20.
//

import UIKit
import KakaoSDKAuth

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func KakaoLogin(_ sender: Any) {
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
    
}
