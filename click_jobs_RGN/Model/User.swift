//
//  User.swift
//  click_jobs_RGN
//
//  Created by Muslim on 13/02/23.
//

import Foundation

struct User {
    var id: String
    var firstName: String
    var lastName: String
    var phone: String
    var email: String
    var tgUsername: String
    //    var jobTitle: String
    var isOccupied: Bool
    var resumeUrl: String
    var savedVacancies: [String]
    
    var login: String
    var password: String
    
    var companyID: String
    var isEmployer: Bool
    
    
    
    func getDictionary() -> [String: Any] {
        return [
            "companyID":companyID,
            "email":email,
            "firstName":firstName,
            "isEmployer":isEmployer,
            "isOccupied":isOccupied,
            //            "jobTitle":jobTitle,
            "lastName":lastName,
            "login":login,
            "password":password,
            "phone":phone,
            "resumeURL":resumeUrl,
            "savedVacancies": savedVacancies,
            "tgUsername":tgUsername
            
        ]
    }
    
}
