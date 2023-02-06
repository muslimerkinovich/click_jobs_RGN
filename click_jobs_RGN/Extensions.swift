//
//  Extensions.swift
//  click_jobs_RGN
//
//  Created by Muslim on 02/02/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func enableDismissKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardHandler))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboardHandler(){
        self.view.endEditing(true)
    }
    
    
}
