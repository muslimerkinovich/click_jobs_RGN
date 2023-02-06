//
//  VacancyCell.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class VacancyCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var companyTitle: UILabel!
    
    @IBOutlet var tags: [UILabel]!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var salaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.systemGray3.cgColor
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 5
        
        for tag in tags {
            tag.clipsToBounds = true
            tag.layer.cornerRadius = tag.frame.size.height / 2
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        
        
    }
    
}
