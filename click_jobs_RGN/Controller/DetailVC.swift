//
//  DetailVC.swift
//  click_jobs_RGN
//
//  Created by Muslim on 06/02/23.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageLeftView: UIView!
    @IBOutlet weak var imageRightView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var addressInfoBtn: UIButton!
    @IBOutlet weak var levelInfoBtn: UIButton!
    
    @IBOutlet weak var btnColView: UICollectionView!
    @IBOutlet weak var infoColView: UICollectionView!
    
    @IBOutlet weak var applyBtn: UIButton!
    
    var btnNames: [String] = ["Description", "Map", "Company", "More Info", "Description", "Map", "Company", "More Info", "Description", "Map", "Company", "More Info", "Description", "Map", "Company", "More Info", ]
    
    var currentIndex: Int = 0
    
    //MARK: - View Life Cycle Method functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupSubviews()
        setupColView()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }

    //MARK: - @IBAction functions
    
    
    //MARK: - Setup functions
    
    func setupNavBar(){
        navigationItem.title = "Job Detail"
        
        let saveBtn = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
                                      style: .done,
                                      target: self,
                                      action: #selector(saveBtnHandler))
        
        navigationItem.rightBarButtonItem = saveBtn
        
    }
    
    func setupSubviews(){
        imageView.layer.cornerRadius = 10
        imageContainer.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 10)
        imageRightView.roundCorners(corners: .topLeft, radius: 10)
        imageLeftView.roundCorners(corners: .topRight, radius: 10)
        
        applyBtn.layer.shadowColor = UIColor.white.cgColor
        applyBtn.layer.shadowRadius = 20
        applyBtn.layer.shadowOpacity = 1
        applyBtn.layer.shadowOffset = CGSize(width: 0, height: -10)
    }
    
    func setupColView(){
        btnColView.delegate = self
        btnColView.dataSource = self
        btnColView.register(UINib(nibName: "BtnCell", bundle: nil), forCellWithReuseIdentifier: "BtnCell")

        infoColView.delegate = self
        infoColView.dataSource = self
        infoColView.register(UINib(nibName: "InfoColCell",
                                   bundle: nil),
                             forCellWithReuseIdentifier: "InfoColCell")
    }

    
    
    //MARK: - @objc functions
    
    @objc func saveBtnHandler(){
        print("save job")
    }
}

    //MARK: - UICollectionView Delegates
extension DetailVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        btnNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == btnColView {
            return .zero
        } else {
            return .zero
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == btnColView {
            return .zero
        } else {
            return .zero
        }
    }
    
    /*
     
     if collectionView == btnColView {
        
     } else {
        
     }
     
     */
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == btnColView {
            let wifth: CGFloat = btnNames[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19)]).width + 35
            let height: CGFloat = 50
            return CGSize(width: wifth, height: height)
        } else {
            return CGSize(width: infoColView.frame.size.width,
                          height: infoColView.frame.size.height)
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == btnColView {
            return UIEdgeInsets(top: 0,
                                left: 10,
                                bottom: 0,
                                right: 10)
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == btnColView {
            let cell = btnColView.dequeueReusableCell(withReuseIdentifier: "BtnCell", for: indexPath) as! BtnCell
            
            cell.btn.configuration?.title = btnNames[indexPath.row]
            cell.setupBtn(isDark: currentIndex == indexPath.row)
            return cell
        } else {
            let cell = infoColView.dequeueReusableCell(withReuseIdentifier: "InfoColCell", for: indexPath) as! InfoColCell
            
            cell.label.text = btnNames[indexPath.item]
            cell.backgroundColor = .systemGray6
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        btnColView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        infoColView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        currentIndex = indexPath.row
        btnColView.reloadData()
    }
    
    
}
