//
//  SignUpVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var passwordConfirmTextField: CustomTextField!
    
    @IBOutlet weak var segmetnController: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        enableDismissKeyboard()
        navigationItem.title = "Sign Up VC"
    }
    
    //MARK: - @IBAction Functions
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        let tabBar = TabBarVC()
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true)
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

    //MARK: - Setup Functions
    
    func setupTextFields(){
        userNameTextField.setLeftImage(image: UIImage(systemName: "person"),
                                       tintColor: .systemGray)
        
        emailTextField.setLeftImage(image: UIImage(systemName: "envelope"),
                                    tintColor: .systemGray)
        
        passwordTextField.setLeftImage(image: UIImage(systemName: "lock"),
                                       tintColor: .systemGray)
        passwordTextField.setRightImage(image: UIImage(systemName: "eye"),
                                        tintColor: .systemGray)
        
        passwordConfirmTextField.setLeftImage(image: UIImage(systemName: "lock"),
                                       tintColor: .systemGray)
        passwordConfirmTextField.setRightImage(image: UIImage(systemName: "eye"),
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
