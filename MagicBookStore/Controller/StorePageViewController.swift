//
//  StorePageViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class StorePageViewController: UIViewController {
    
    var firstLevelMagics = Skill.firstLevel
    var secondLevelMagics = Skill.secondLevel
    var thirdLevelMagics = Skill.thirdLevel
    var layoutOption: LayoutOption = .list
    var dataOption: LayoutOption.DataOption = .L1
    
    @IBOutlet weak var levelOneMagic: UIButton!
    @IBOutlet weak var levelTwoMagic: UIButton!
    @IBOutlet weak var levelThreeMagic: UIButton!
    @IBOutlet weak var detailArrangement: UIButton!
    @IBOutlet weak var waterFallArrangement: UIButton!
    @IBOutlet weak var currentMoneyView: UIView!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
        
        levelOneMagic.createButtonBorder()
        levelTwoMagic.createButtonBorder()
        levelThreeMagic.createButtonBorder()
        detailArrangement.createButtonBorder()
        waterFallArrangement.createButtonBorder()
        currentMoneyView.createViewBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 讀取存的錢
         if let savedMoney = UserDefaultsWrapper.manager.loadSavedMoney() {
             moneyLabel.text = "$ \(savedMoney)"
         }
    }

    @IBAction func backToHome(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showL1Data(_ sender: UIButton) {
        dataOption = .L1
        collectionView.reloadData()
    }
    
    @IBAction func showL2Data(_ sender: UIButton) {
        dataOption = .L2
        collectionView.reloadData()
    }
    
    @IBAction func showL3Data(_ sender: UIButton) {
        dataOption = .L3
        collectionView.reloadData()
    }
    
    @IBAction func changeToListLayout(_ sender: UIButton) {
        layoutOption = .list
        collectionView.reloadData()
    }
    
    @IBAction func changeToGridLayout(_ sender: UIButton) {
        layoutOption = .grid
        collectionView.reloadData()
    }
    
    private func registerNib() {
        collectionView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCell")
        collectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let buyingVC = storyboard?.instantiateViewController(withIdentifier: "buyingVC")
        present(buyingVC!, animated: false)
    }
}


extension StorePageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch dataOption {
            
        case .L1:
            return firstLevelMagics.count
            
        case .L2:
            return secondLevelMagics.count
            
        case .L3:
            return thirdLevelMagics.count
        }
    }
    
    // 設定 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let firstLevelMagic = firstLevelMagics[indexPath.item]
        let secondLevelMagic = secondLevelMagics[indexPath.item]
        let thirdLevelMagic = thirdLevelMagics[indexPath.item]
        
        switch layoutOption {
            
        case .list:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCollectionViewCell
            
            switch dataOption {
                
            case .L1:
                cell.setInformation(information: firstLevelMagic)
                
            case .L2:
                cell.setInformation(information: secondLevelMagic)
                
            case .L3:
                cell.setInformation(information: thirdLevelMagic)
            }
            
            return cell
            
        case .grid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCollectionViewCell
            
            switch dataOption {
                
            case .L1:
                cell.setInformationForShop(information: firstLevelMagic)
                
            case .L2:
                cell.setInformationForShop(information: secondLevelMagic)
                
            case .L3:
                cell.setInformationForShop(information: thirdLevelMagic)
            }
            
            return cell
        }
    }
}


extension StorePageViewController: UICollectionViewDelegateFlowLayout {
    
    //  設定 CollectionViewCell 的寬、高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch layoutOption {
            
        case .list:
            return CGSize(width: collectionView.frame.size.width, height: 100)
            
        case .grid:
            return CGSize(width: collectionView.frame.size.width / 4 , height: 100)
        }
    }
}


extension UIButton {
    func createButtonBorder() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
}


extension UIView {
    func createViewBorder() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
}
