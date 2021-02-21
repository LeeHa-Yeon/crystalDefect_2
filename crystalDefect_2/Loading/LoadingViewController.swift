//
//  LoadingViewController.swift
//  crystalDefect_2
//
//  Created by 이하연 on 2021/02/20.
//

import UIKit
import KakaoSDKAuth

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
            
            if AuthApi.hasToken(){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateInitialViewController()
                         vc?.modalPresentationStyle = .fullScreen
                         present(vc!, animated: false, completion: nil)
                print("Auto Login , Main")
            }else{
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                let vc = storyboard.instantiateInitialViewController()
                         vc?.modalPresentationStyle = .fullScreen
                         self.present(vc!, animated: false, completion: nil)
                print("Auto Login , Login")
            }
        sleep(1)
    }
}
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


