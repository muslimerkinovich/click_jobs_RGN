//
//  BtnCell.swift
//  click_jobs_RGN
//
//  Created by Muslim on 07/02/23.
//

import UIKit

class BtnCell: UICollectionViewCell {

    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupBtn(isDark: Bool) {
        btn.configuration?.baseBackgroundColor = isDark ? .black : .systemGray6
        btn.configuration?.baseForegroundColor = isDark ? .white : .systemGray
        btn.configuration?.background.strokeWidth = isDark ? 0 : 1
    }

}
