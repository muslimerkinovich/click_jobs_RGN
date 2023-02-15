//
//  WelcomeVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 02/02/23.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        let vc = SignInVC(nibName: "SignInVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func signupBtnPressed(_ sender: UIButton) {
        let vc = SignUpVC(nibName: "SignUpVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
}
