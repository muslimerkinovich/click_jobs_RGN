//
//  SignUpVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var userNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var passwordConfirmTextField: CustomTextField!
    
    @IBOutlet weak var segmetnController: UISegmentedControl!
    
    
    var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFields()
        enableDismissKeyboard()
        navigationItem.title = "Sign Up VC"
    }
    
    //MARK: - @IBAction Functions
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
//        let tabBar = TabBarVC()
//        tabBar.modalPresentationStyle = .fullScreen
//        self.present(tabBar, animated: true)
        registerUser()
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

}

extension SignUpVC {
    func registerUser() {
        let isEmployer = segmetnController.selectedSegmentIndex == 0
        let user = User(id: "12",
                        firstName: userNameTextField.text ?? "",
                        lastName: "",
                        phone: emailTextField.text ?? "",
                        email: emailTextField.text ?? "",
                        tgUsername: "sldj",
                        isOccupied: true,
                        resumeUrl: "sdk",
                        savedVacancies: [],
                        login: "23232",
                        password: passwordTextField.text ?? "",
                        companyID: "sds",
                        isEmployer: isEmployer)
        
        var ref: DocumentReference? = nil
        
        ref = self.db.collection("user").addDocument(data: user.getDictionary()) { error in
            if let er = error {
                print(er.localizedDescription, "ERROR")
            }else {
                
                var newU = user
                newU.id = ref!.documentID
                
                print(newU, "USER")
                
                SharedManager().setToken(id: ref!.documentID, isEmployer: user.isEmployer)
            }
        }
    }
}
