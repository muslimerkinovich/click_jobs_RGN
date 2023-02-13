//
//  SharedManager.swift
//  click_jobs_RGN
//
//  Created by Muslim on 13/02/23.
//

import Foundation

class SharedManager {
    static let shared = SharedManager()
    
    
    func setToken(id: String, isEmployer: Bool) {
        UserDefaults.standard.set(id, forKey: Cache.userId)
        UserDefaults.standard.set(isEmployer, forKey: Cache.isEmployer)
    }
    
    func getToken() {
        UserDefaults.standard.string(forKey: Cache.userId)
    }
}
