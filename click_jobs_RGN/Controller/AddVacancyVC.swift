//
//  AddVacancyVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class AddVacancyVC: UIViewController {

    @IBOutlet weak var jobCategoryBtn: UIButton!
    @IBOutlet weak var jobSubcategoryBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPopUpButton()
        setupNavBar()
        // Do any additional setup after loading the view.
    }

    //MARK: - @IBAction Functions
    
    //MARK: - Setup Functions
    
    func setupPopUpButton(){
        
        let closure = { (action: UIAction) in
        }
        
        jobCategoryBtn.menu = UIMenu(children: [
            UIAction(title: "Frontend", handler: closure),
            UIAction(title: "Backend", handler: closure),
            UIAction(title: "iOS", handler: closure),
            UIAction(title: "Android", handler: closure),

        ])
        
        jobSubcategoryBtn.menu = UIMenu(children: [
            UIAction(title: "Vue.js", handler: closure),
            UIAction(title: "React.js", handler: closure),
            UIAction(title: "Node.js", handler: closure),
            UIAction(title: "Laravel", handler: closure),

        ])
    }
    
    func setupNavBar(){
        navigationItem.title = "Add Vacancy"
        
        let doneBtn = UIBarButtonItem(image: UIImage(systemName: "checkmark"), style: .done, target: self, action: #selector(doneBtnHandler))
        navigationItem.rightBarButtonItem = doneBtn
    }
    
    //MARK: - @objc functions
    
    @objc func doneBtnHandler() {
        print("done button pressed")
    }

}
