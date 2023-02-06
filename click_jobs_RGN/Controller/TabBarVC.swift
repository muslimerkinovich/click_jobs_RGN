//
//  TabBarVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            generateVC(vc: MainVC(nibName: "MainVC", bundle: nil),
                       title: "Home",
                       image: UIImage(systemName: "house")),
            generateVC(vc: AddVacancyVC(nibName: "AddVacancyVC", bundle: nil),
                       title: "Add",
                       image: UIImage(systemName: "plus")),
            generateVC(vc: MainVC(nibName: "MainVC", bundle: nil),
                       title: "Saved",
                       image: UIImage(systemName: "bookmark")),
            generateVC(vc: ProfileVC(nibName: "ProfileVC", bundle: nil),
                       title: "Profile",
                       image: UIImage(systemName: "person")),
            
        ]
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
