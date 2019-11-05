//
//  StorePageViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class StorePageViewController: UIViewController {

    var testArray = ["magic-bolt", "magic-cure-posion", "magic-decrease-weight", "magic-detection"]
    
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
    
    private func registerNib() {
        collectionView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCell")
    }
    
}


extension StorePageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // 設定 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCollectionViewCell
        cell.skillImage.image = UIImage(named: testArray[indexPath.row])
        
        return cell
    }
}


extension StorePageViewController: UICollectionViewDelegateFlowLayout {
    
    //  設定 CollectionViewCell 的寬、高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80 , height: 80)
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
