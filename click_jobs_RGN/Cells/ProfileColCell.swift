//
//  ProfileColCell.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class ProfileColCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var btnClosure: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowColor = UIColor.systemGray3.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOffset = .zero
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        if let btnClosure {
            btnClosure()
        }
    }
}
