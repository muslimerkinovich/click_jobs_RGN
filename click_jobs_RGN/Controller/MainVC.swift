//
//  MainVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
    }

    //MARK: - @IBAction Functions
    
    
    
    //MARK: - Setup Functions
    
    func setupNavBar(){
        navigationItem.title = "Vacancies"

        let filterBtn = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"),
                                        style: .done,
                                        target: self,
                                        action: nil)
        navigationItem.rightBarButtonItem = filterBtn
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "VacancyCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "VacancyCell")
        tableView.separatorStyle = .none
        tableView.layer.masksToBounds = true
    }

}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacancyCell") as! VacancyCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
    
    
}
