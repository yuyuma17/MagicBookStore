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
    var layoutOption: LayoutOption = .grid
    
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
    
}


extension StorePageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firstLevelMagics.count
    }
    
    // 設定 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch layoutOption {
            
        case .list:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCollectionViewCell
            let firstLevelMagic = firstLevelMagics[indexPath.item]
            cell.setInformation(information: firstLevelMagic)
            return cell
            
        case .grid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCollectionViewCell
            let firstLevelMagic = firstLevelMagics[indexPath.item]
            cell.setInformation(information: firstLevelMagic)
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
            return CGSize(width: 80 , height: 80)
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
