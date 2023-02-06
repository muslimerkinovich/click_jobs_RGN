//
//  CustomTextField.swift
//  click_jobs_RGN
//
//  Created by Muslim on 02/02/23.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CornerStyle: CGFloat {
        case small = 5
        case medium = 10
        case large = 20
        case rounded
    }
    
    func setPadding(paddingLeft: Int, paddingRight: Int) {
        let paddingLeftView: UIView = UIView(frame: CGRect(x: 0,
                                                           y: 0,
                                                           width: paddingLeft,
                                                           height: Int(self.frame.size.height)))
        self.leftView = paddingLeftView
        self.leftViewMode = .always
        
        let paddingRightView: UIView = UIView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: paddingRight,
                                                            height: Int(self.frame.size.height)))
        self.rightView = paddingRightView
        self.rightViewMode = .always
        
    }
    
    func setBorder(borderWidth: CGFloat, borderColor: UIColor) {
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
    }
    
    func setCorner(cornerStyle: CornerStyle) {
        self.clipsToBounds = true
        
        switch cornerStyle {
        case .small:
            self.layer.cornerRadius = cornerStyle.rawValue
        case .medium:
            self.layer.cornerRadius = cornerStyle.rawValue
        case .large:
            self.layer.cornerRadius = cornerStyle.rawValue
        default:
            self.layer.cornerRadius = self.frame.size.height / 2
        }
    }
    
    func setCorner(cornerRadius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    
    func setLeftImage(image: UIImage?, tintColor: UIColor = .systemGray){
        
        if let img = image {
            self.leftViewMode = UITextField.ViewMode.always
            
            let height = self.frame.size.height
            let imageContainer: UIView = UIView(frame: CGRect(x: 0,
                                                              y: 0,
                                                              width: height,
                                                              height: height))
            
            let imageView: UIImageView = UIImageView(image: img)
            imageView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: height,
                                     height: height)
            imageView.contentMode = .center
            imageView.tintColor = tintColor
            imageContainer.addSubview(imageView)
            
            self.leftView = imageContainer
        } else {
            self.leftViewMode = UITextField.ViewMode.always
            let paddingView: UIView = UIView(frame: CGRect(x: 0,
                                                           y: 0,
                                                           width: 10,
                                                           height: 10))
            self.leftView = paddingView
            
        }
    }
    
    let rightBtn = UIButton()
    func setRightImage(image: UIImage?, tintColor: UIColor = .systemGray){
        
        if let img = image {
            self.rightViewMode = UITextField.ViewMode.always
            
            let height = self.frame.size.height
            let imageContainer: UIView = UIView(frame: CGRect(x: 0,
                                                              y: 0,
                                                              width: height,
                                                              height: height))
            
            rightBtn.frame = CGRect(x: 0,
                                    y: 0,
                                    width: height,
                                    height: height)
            rightBtn.configuration = .plain()
            rightBtn.configuration?.title = ""
            rightBtn.configuration?.image = img
            rightBtn.addTarget(self, action: #selector(rightBtnHandler(_ :)), for: .touchUpInside)
            imageContainer.addSubview(rightBtn)
            
            self.rightView = imageContainer
            
        } else {
            self.rightViewMode = UITextField.ViewMode.always
            let paddingView: UIView = UIView(frame: CGRect(x: 0,
                                                           y: 0,
                                                           width: 10,
                                                           height: 10))
            self.rightView = paddingView
        }
        
    }
    
    //MARK: - @objc functions
    
    @objc func rightBtnHandler(_ sender: UIButton){
        if sender.tag == 0 {
            self.setRightImage(image: UIImage(systemName: "eye.slash"))
            sender.tag = 1
        } else {
            self.setRightImage(image: UIImage(systemName: "eye"))
            sender.tag = 0
        }
    }
    
    
    //MARK: - Main loading functions
    
    func setup() {
        
        setPadding(paddingLeft: 10, paddingRight: 10)
        setBorder(borderWidth: 1, borderColor: .systemGray2)
        setCorner(cornerStyle: .small)
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
}
