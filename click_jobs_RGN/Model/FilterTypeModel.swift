//
//  FilterTypeModel.swift
//  click_jobs_RGN
//
//  Created by Muslim on 09/02/23.
//

import Foundation
import UIKit

struct FilterTypeModel {
    var title: String
    var image: UIImage
    var items: [String]
    var selectedItem: String?
    var isExpanded: Bool
}
