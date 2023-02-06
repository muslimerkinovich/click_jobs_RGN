//
//  ProfileVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 03/02/23.
//

import UIKit

struct Settings {
    let name: String
    let image: UIImage?
    let action: (() -> Void)
}

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var jobTitleLbl: UILabel!
    @IBOutlet weak var completeNumberLbl: UILabel!
    @IBOutlet var completeViews: [UIView]!
    
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var settings: [Settings] = [
        Settings(name: "My activity", image: UIImage(systemName: "person"), action: {
            print("my activity")
        }),
        Settings(name: "My location", image: UIImage(systemName: "person"), action: {
            print("my location")
        }),
        Settings(name: "Notification Settings", image: UIImage(systemName: "bell"), action: {
            print("notification")
        }),
        Settings(name: "Log out", image: UIImage(systemName: "arrow.right.to.line"), action: {
            print("log out")
        })
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupNavBar()
        setupSubviews()
        
        setupColView()
        setupTableView()
    }

    //MARK: - @IBAction functions
    
    
    
    //MARK: - Setup functions
    
    func setupNavBar(){
        navigationItem.title = "Profile"
        
        let settingsBtn = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                         style: .done,
                                         target: self,
                                         action: #selector(settingsBtnHandler))
        navigationItem.rightBarButtonItem = settingsBtn
    }
    
    func setupColView(){
        colView.delegate = self
        colView.dataSource = self
        colView.register(UINib(nibName: "ProfileColCell",
                               bundle: nil),
                         forCellWithReuseIdentifier: "ProfileColCell")
        
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingsCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "SettingsCell")
        tableView.separatorStyle = .none
    }
    
    func setupSubviews(){
        for completeView in completeViews {
            completeView.layer.cornerRadius = completeView.frame.size.height / 2
        }
        
        profileImg.layer.cornerRadius = profileImg.frame.size.height / 2
//        profileImg.layer.shadowColor = UIColor.systemGray2.cgColor
//        profileImg.layer.shadowRadius = 10
//        profileImg.layer.shadowOpacity = 0.5
//        profileImg.layer.shadowOffset = .zero
    }



    //MARK: - @objc functions
    
    @objc func settingsBtnHandler(){
        
        
    }
}

extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "ProfileColCell", for: indexPath) as! ProfileColCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = colView.frame.size.width / 2.3
        let height: CGFloat = colView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0,
                     left: 10,
                     bottom: 0,
                     right: 10)
    }
}


extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell") as! SettingsCell
        
        cell.selectionStyle = .none
        cell.label.text = settings[indexPath.row].name
        cell.leftImage.image = settings[indexPath.row].image
        if indexPath.row == settings.count - 1 {
            cell.leftImage.tintColor = .red
            cell.rightImage.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
