//
//  SignInVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 02/02/23.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    let db = Firestore.firestore()
    
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
//        let tabBar = TabBarVC()
//        tabBar.modalPresentationStyle = .fullScreen
//        self.present(tabBar, animated: true)
//        self.signIn(login: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        
        APIClient.shared.isUserExist(email: emailTextField.text ?? "email@mail.com",
                                     password: passwordTextField.text ?? "password") { user, error in
            if let error {
                print(error, "error print in Sign In VC")
            } else if let user{
                print(user)
            } else {
                print("User not found")
            }
        }
        
        // isuserexist and push to tabbar
    }
    

    
    @IBAction func signUpBtnPressed(_ sender: UIButton) {
        
        let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil)
        signUpVC.modalPresentationStyle = .fullScreen
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

extension SignInVC {
    func signIn(login: String, password: String) {
        let users = db.collection("user")
    
        let _ = users.whereField("phone", isEqualTo: login).whereField("password", isEqualTo: password).getDocuments { snapshot, error in
            if let err = error {
                print("error", err)
            }else {
                if let snap = snapshot {
                    if !snap.isEmpty {
                        let data = snap.documents.first!
                        print(data, "first")
                        
                        let isEmployer = data.data()["isEmployer"] as? Bool ?? false
                        SharedManager().setToken(id: data.documentID, isEmployer: isEmployer)
                    }
                }
            }
        }
    }
}
