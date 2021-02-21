//
//  LoginViewController.swift
//  crystalDefect_2
//
//  Created by 이하연 on 2021/02/20.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    var isAutoLogin : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // auto login checkbox 버튼 만들기
    @IBAction func autoLoginButton(_ sender: UIButton) {
        // auto login 선택 여부
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            isAutoLogin = true
        }else{
            isAutoLogin = false
        }
        
    }
    
    @IBAction func KakaoLogin(_ sender: Any) {
        // 카카오톡 로그인 성공 유무
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateInitialViewController()
                         vc?.modalPresentationStyle = .fullScreen
                         self.present(vc!, animated: false, completion: nil)
                print("Auto Login , Main")
                // TODO: - 로그인 성공 시 회원 아이디, 비번 가져오기
            }
        }
        // 사용자 정보 가져오기
        // TODO: 사용자 정보 가져와서 데이터베이스에 저장
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                // print(" 사용자 ID ---> \(user?.id)")
                // print(" 사용자 PWD ---> 아직 모르겠음")
            }
            
        }
    }
    

    /*
     if self.isAutoLogin{
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyboard.instantiateInitialViewController()
                  vc?.modalPresentationStyle = .fullScreen
                  self.present(vc!, animated: false, completion: nil)
         print("Auto Login , Main")
     }
     else{
         let storyboard = UIStoryboard(name: "Login", bundle: nil)
         let vc = storyboard.instantiateInitialViewController()
                  vc?.modalPresentationStyle = .fullScreen
                  self.present(vc!, animated: false, completion: nil)
         print("Auto Login No , Login")
     }
     */
    
    
    
}
