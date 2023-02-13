//
//  VacancyCell.swift
//  click_jobs_RGN
//
//  Created by Muslim on 13/02/23.
//

import UIKit

class VacancyCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var workTypeLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
