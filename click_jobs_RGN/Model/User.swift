//
//  User.swift
//  click_jobs_RGN
//
//  Created by Muslim on 13/02/23.
//

import Foundation

//struct User {
//    var id: String
//    var firstName: String
//    var lastName: String
//    var phone: String
//    var email: String
//    var tgUsername: String
//    //    var jobTitle: String
//    var isOccupied: Bool
//    var resumeUrl: String
//    var savedVacancies: [String]
//
//    var login: String
//    var password: String
//
//    var companyID: String
//    var isEmployer: Bool
//
//
//
//    func getDictionary() -> [String: Any] {
//        return [
//            "companyID":companyID,
//            "email":email,
//            "firstName":firstName,
//            "isEmployer":isEmployer,
//            "isOccupied":isOccupied,
//            //            "jobTitle":jobTitle,
//            "lastName":lastName,
//            "login":login,
//            "password":password,
//            "phone":phone,
//            "resumeURL":resumeUrl,
//            "savedVacancies": savedVacancies,
//            "tgUsername":tgUsername
//
//        ]
//    }
//
//}


struct User {
    
    let userID: Int
    let email: String
    let password: String
    let isEmployer: Bool
    
    func getDictionary() -> [String: Any] {
        return [
            "userID": userID,
            "email": email,
            "password": password,
            "isEmployer": isEmployer
        ]
    }
}

struct Worker {
    let userID: Int
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let yearsOld: String
    let resumeID: [Int]
    let savedVacancy: [Int]
    
    func getDictionay() -> [String: Any] {
        return [
            "userID": userID,
            "email": email,
            "password": password,
            "firstName": firstName,
            "lastName": lastName,
            "phoneNumber": phoneNumber,
            "yearsOld": yearsOld,
            "resumeID": resumeID,
            "savedVacancy": savedVacancy
        ]
    }
}

struct Company {
    let userID: String
    let email: String
    let password: String
    let companyName: String
    let phoneNumber: String
    let city: String?
    let location: [String: Any]?
    let vacancyID: [Int]
    
    func getDictionay() -> [String: Any] {
        return [
            "userID": userID,
            "companyName": companyName,
            "email": email,
            "password": password,
            "phoneNumber": phoneNumber,
            "city": city ?? "",
            "location": location ?? [:],
            "vacancyID": vacancyID,
        ]
    }
}
