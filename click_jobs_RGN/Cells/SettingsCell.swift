//
//  SettingsCell.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class SettingsCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowColor = UIColor.systemGray2.cgColor
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOffset = .zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
