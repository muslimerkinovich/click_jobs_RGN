//
//  SignUpVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var typeController: UISegmentedControl!
    @IBOutlet weak var firstNameTF: CustomTextField!
    @IBOutlet weak var lastNameTF: CustomTextField!
    @IBOutlet weak var companyNameTF: CustomTextField!
    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var phoneNumber: CustomTextField!
    @IBOutlet weak var passwordTF: CustomTextField!
    @IBOutlet weak var passwordConfirm: CustomTextField!
    
    
    var db = Firestore.firestore()
    
    var isEmployer: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableDismissKeyboard()        
        setupTextFields()
        updateTextFields(isEmployer: isEmployer)
        
    }
    
    //MARK: - @IBAction Functions
    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        //        let tabBar = TabBarVC()
        //        tabBar.modalPresentationStyle = .fullScreen
        //        self.present(tabBar, animated: true)
        //        registerUser()
    }
    
    @IBAction func signInBtnPressed(_ sender: UIButton) {
        let vc = SignInVC(nibName: "SignInVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func typeControllerChanged(_ sender: UISegmentedControl) {
        isEmployer = sender.selectedSegmentIndex == 0
        updateTextFields(isEmployer: isEmployer)
    }
    
    
    
    
    //MARK: - Setup Functions
    
    
    func setupTextFields(){
        
        passwordTF.setRightImage(image: UIImage(systemName: "eye"))
        passwordConfirm.setRightImage(image: UIImage(systemName: "eye"))
        
    }
    
    func updateTextFields(isEmployer: Bool){
        
        firstNameTF.isHidden = !isEmployer
        lastNameTF.isHidden = !isEmployer
        companyNameTF.isHidden = isEmployer
        
    }
    
    
}
//
//extension SignUpVC {
//    func registerUser() {
//        let user = User(id: "12",
//                        firstName: userNameTextField.text ?? "",
//                        lastName: "",
//                        phone: emailTextField.text ?? "",
//                        email: emailTextField.text ?? "",
//                        tgUsername: "sldj",
//                        isOccupied: true,
//                        resumeUrl: "sdk",
//                        savedVacancies: [],
//                        login: "23232",
//                        password: passwordTextField.text ?? "",
//                        companyID: "sds",
//                        isEmployer: isEmployer)
//
//        var ref: DocumentReference? = nil
//
//        ref = self.db.collection("user").addDocument(data: user.getDictionary()) { error in
//            if let er = error {
//                print(er.localizedDescription, "ERROR")
//            }else {
//
//                var newU = user
//                newU.id = ref!.documentID
//
//                print(newU, "USER")
//
//                SharedManager().setToken(id: ref!.documentID, isEmployer: user.isEmployer)
//            }
//        }
//    }
//}
