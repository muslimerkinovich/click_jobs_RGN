//
//  APIClient.swift
//  click_jobs_RGN
//
//  Created by Muslim on 13/02/23.
//

import Foundation
import Firebase

class APIClient {
    
    static var shared = APIClient()
    static let db = Firestore.firestore()
    
    //
    

    
    func isUserExist(email: String, password: String, comletion: @escaping(User?, Error?) -> Void){
        APIClient.db.collection("user")
            .whereField("email", isEqualTo: email)
            .whereField("password", isEqualTo: password)
            .getDocuments { snapshot, error in
                if let error {
                    print(error, "FireBase getDocument Error")
                    comletion(nil, error)
                } else {
                    guard let document = snapshot?.documents.first?.data() as? [String: Any] else { return comletion(nil, nil)}

                    let user = User(userID: document["userID"] as? Int ?? 1 ,
                                    email: document["email"] as? String ?? "",
                                    phoneNumber: document["phoneNumber"] as? String ?? "",
                                    password: document["password"] as? String ?? "",
                                    isEmployer: document["isEmployer"] as? Bool ?? true)
                    
                    comletion(user, nil)
                }
        }
    }
    
    func registerUser(user: User){
        
        APIClient.shared.isUserExist(email: user.email,
                                     password: user.password) { existUser, error in
            if let error {
                print(error)
            } else if let existUser {
                print("User already exists with \(existUser.email) email address.")
            } else {
                
                APIClient.db
                    .collection(URLS.shared.user)
                    .addDocument(data: user.getDictionary())
                { error in
                    if let error {
                        print(error)
                    }
                }
            }
        }
        
    }
    
}
