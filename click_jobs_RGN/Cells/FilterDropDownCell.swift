//
//  FilterDropDownCell.swift
//  click_jobs_RGN
//
//  Created by Muslim on 09/02/23.
//

import UIKit

class FilterDropDownCell: UITableViewCell {

    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var rightImgView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var didSelectClosure: ((_ selectedItem: String) -> Void)? = nil
    var items: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - @IBAction functions
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender.tag == 0{
            sender.tag = 1
            tableViewHeight.constant = 170
        } else {
            tableViewHeight.constant = 0
            sender.tag = 0
        }
    }
    
    
    //MARK: - setup functions
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.layer.borderColor = UIColor.systemGray2.cgColor
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 10
    }
    
    func setupSubviews(filterModel: FilterTypeModel, closure: ((_ selectedItem: String) -> Void)?){
        self.jobTitle.text = filterModel.title
        self.btn.configuration?.image = filterModel.image
        self.btn.configuration?.title = filterModel.selectedItem ?? filterModel.items[0]
        self.items = filterModel.items
        self.didSelectClosure = closure
        let tvHeight: CGFloat = filterModel.isExpanded ? CGFloat(filterModel.items.count * 45 + 20) : 0
        self.tableViewHeight.constant = tvHeight
    }
    
}

extension FilterDropDownCell:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.selectionStyle = .none
        cell.textLabel?.text = items[indexPath.row]
        print(cell.frame.size.height)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .zero
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        .zero
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let didSelectClosure {
            
            //index path row item text
            didSelectClosure(items[indexPath.row])
        }
    }
}
