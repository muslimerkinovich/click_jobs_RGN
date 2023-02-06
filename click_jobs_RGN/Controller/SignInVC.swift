//
//  SignInVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 02/02/23.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "Sign In"
        self.enableDismissKeyboard()
        setupTextFields()
    }
    
    //MARK: - @@IBAction functions
    
    @IBAction func forgotBtnPRessed(_ sender: UIButton) {
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        let tabBar = TabBarVC()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true)
    }
    
    @IBAction func signInWithGoogleBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func signInWithFacebookPressed(_ sender: UIButton) {
    }
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        
        let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil)
        signUpVC.modalPresentationStyle = .fullScreen
        signUpVC.modalTransitionStyle = .flipHorizontal
        self.present(signUpVC, animated: true)
    }
    
    
    //MARK: - Setup functions
    
    func setupTextFields(){
        
        //email text field setup
        emailTextField.setLeftImage(image: UIImage(systemName: "envelope"),
                                    tintColor: .systemGray)
        
        //password text field setup
        passwordTextField.setLeftImage(image: UIImage(systemName: "lock"),
                                       tintColor: .systemGray)
        passwordTextField.setRightImage(image: UIImage(systemName: "eye"),
                                        tintColor: .systemGray)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
