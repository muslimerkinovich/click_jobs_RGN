//
//  MainVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    //MARK: - @IBAction Functions
    
    
    
    //MARK: - Setup Functions
    
    func setupNavBar(){
        navigationItem.title = "Vacancies"
        
        let filterBtn = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3"),
                                        style: .done,
                                        target: self,
                                        action: #selector(filterBtnHandler))
        let searchBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                        style: .done,
                                        target: self,
                                        action: #selector(searchBtnHandler))
        navigationItem.rightBarButtonItems = [filterBtn, searchBtn]
        
        
        searchController.delegate = self
        //            searchController.searchResultsUpdater = self.viewModel
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search vacancy"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
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
    
    //MARK: - @objc functions
    
    @objc func filterBtnHandler(){
        
        let vc = FilterVC(nibName: "FilterVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func searchBtnHandler(){
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                                   at: .top,
                                   animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
        
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC(nibName: "DetailVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath == IndexPath(item: 0, section: 0) {
            self.navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    
}

extension MainVC: UISearchControllerDelegate {
    func didPresentSearchController(_ searchController: UISearchController) {
        
    }
}
