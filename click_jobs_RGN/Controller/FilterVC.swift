//
//  FilterVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var filterModels: [FilterTypeModel] = [
        FilterTypeModel(title: "Job Category",
                        image: UIImage(systemName: "person")!,
                        items: ["None", "Designer", "Developer", "Player", "Teacher", "Motion Graphic Designer",],
                        isExpanded: false),
        FilterTypeModel(title: "Job Category 1",
                        image: UIImage(systemName: "person")!,
                        items: ["None", "Designer", "Developer", "Player", "Teacher", "Motion Graphic Designer",],
                        isExpanded: false),
        FilterTypeModel(title: "Job Category 2",
                        image: UIImage(systemName: "person")!,
                        items: ["None", "Designer", "Developer", "Player", "Teacher", "Motion Graphic Designer",],
                        isExpanded: false),
        FilterTypeModel(title: "Job Category 3",
                        image: UIImage(systemName: "person")!,
                        items: ["None", "Designer", "Developer", "Player", "Teacher", "Motion Graphic Designer",],
                        isExpanded: false),
    ]
    
    //MARK: - VC Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }

    //MARK: - Setup functions

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FilterDropDownCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "FilterDropDownCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
    
}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterDropDownCell") as! FilterDropDownCell
        cell.selectionStyle = .none
        
        let filterModel = filterModels[indexPath.row]
        
        cell.setupSubviews(filterModel: filterModel) { [self] selectedItem in
            filterModels[indexPath.row].selectedItem = selectedItem
            filterModels[indexPath.row].isExpanded.toggle()
            tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? FilterDropDownCell else { return  }
        
        filterModels[indexPath.row].isExpanded = !filterModels[indexPath.row].isExpanded
        
        let isExpanded = filterModels[indexPath.row].isExpanded
        cell.tableViewHeight.constant = isExpanded ? 200 : 0
//        tableView.beginUpdates()
//        tableView.endUpdates()
        tableView.reloadData()
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        print("didSelect")
    }
}
