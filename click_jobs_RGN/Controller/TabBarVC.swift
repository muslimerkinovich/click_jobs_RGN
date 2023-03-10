//
//  TabBarVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class TabBarVC: UITabBarController {

    var isEmployer = UserDefaults.standard.bool(forKey: "IS_EMPLOYER")

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVCs()
        
    }
    
    func setupVCs(){
        
        let employerVCs = [
            generateVC(vc: MainVC(nibName: "MainVC", bundle: nil),
                       title: "Employee",
                       image: UIImage(systemName: "house")),
            generateVC(vc: AddVacancyVC(nibName: "AddVacancyVC", bundle: nil),
                       title: "Add",
                       image: UIImage(systemName: "plus")),
            generateVC(vc: MainVC(nibName: "MainVC", bundle: nil),
                       title: "Applicants",
                       image: UIImage(systemName: "bookmark")),
            generateVC(vc: ProfileVC(nibName: "ProfileVC", bundle: nil),
                       title: "Profile",
                       image: UIImage(systemName: "person")),
        ]
        
        let employeeVCs = [
            generateVC(vc: MainVC(nibName: "MainVC", bundle: nil),
                       title: "Vacancy",
                       image: UIImage(systemName: "house")),
            generateVC(vc: MainVC(nibName: "MainVC", bundle: nil),
                       title: "Saved",
                       image: UIImage(systemName: "bookmark")),
            generateVC(vc: ProfileVC(nibName: "ProfileVC", bundle: nil),
                       title: "Profile",
                       image: UIImage(systemName: "person")),
        ]
        
        viewControllers = isEmployer ? employerVCs : employeeVCs
    }
    

    func generateVC(vc: UIViewController, title: String = "", image: UIImage? = nil) -> UIViewController {
        
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        if let img = image {
            nav.tabBarItem.image = img
        }
        
        return nav
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
