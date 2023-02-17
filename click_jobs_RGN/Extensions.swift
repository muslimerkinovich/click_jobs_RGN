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

extension UIView {
//    func roundCorners(corners: UIRectCorner.ArrayLiteralElement, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds,
//                               byRoundingCorners: corners,
//                               cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
    
    func roundCorners(corners: UIRectCorner.ArrayLiteralElement, radius: CGFloat) {
            if #available(iOS 11.0, *) {
                clipsToBounds = true
                layer.cornerRadius = radius
                layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
            } else {
                let path = UIBezierPath(
                    roundedRect: bounds,
                    byRoundingCorners: corners,
                    cornerRadii: CGSize(width: radius, height: radius)
                )
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                layer.mask = mask
            }
        }
}


//MARK: LANGUAGE
extension String {
    func localized() -> String {
//        UserDefaults.standard.setValue("ru", forKey: "language")
        let lang = UserDefaults.standard.string(forKey: "language") ?? "uz";//"ru", "en"
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

