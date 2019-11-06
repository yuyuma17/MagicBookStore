//
//  StorePageViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class StorePageViewController: UIViewController {
    
    var layoutOption: LayoutOption = .list
    var dataOption: LayoutOption.DataOption = .L1
    weak var delegate: GetIndexAndDataOption?
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataAndMoney), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moneyLabel.text = "$ \(UserData.money)"
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
    
    @objc func reloadDataAndMoney(notification: NSNotification){
        collectionView.reloadData()
        moneyLabel.text = "$ \(UserData.money)"
    }
    
    private func registerNib() {
        collectionView.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCell")
        collectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let buyingVC = storyboard?.instantiateViewController(withIdentifier: "buyingVC") as? BuyingViewController {
            
            buyingVC.indexPathOfItem = indexPath.item
            
            switch dataOption {
                
            case .L1:
                buyingVC.selectedSkillPrice = Skill.firstLevel[indexPath.item].price
                buyingVC.selectedSkillImage = Skill.firstLevel[indexPath.item].image
                buyingVC.nowDataOption = .L1
                delegate?.receiveIndexAndDataOption(index: buyingVC.indexPathOfItem!, optionNow: .L1)
                
                if Skill.firstLevel[indexPath.item].haveOwned == true {
                    return
                } else {
                    present(buyingVC, animated: false)
                }
                
            case .L2:
                buyingVC.selectedSkillPrice = Skill.secondLevel[indexPath.item].price
                buyingVC.selectedSkillImage = Skill.secondLevel[indexPath.item].image
                buyingVC.nowDataOption = .L2
                delegate?.receiveIndexAndDataOption(index: buyingVC.indexPathOfItem!, optionNow: .L2)
                
                if Skill.secondLevel[indexPath.item].haveOwned == true {
                    return
                } else {
                    present(buyingVC, animated: false)
                }
                
            case .L3:
                buyingVC.selectedSkillPrice = Skill.thirdLevel[indexPath.item].price
                buyingVC.selectedSkillImage = Skill.thirdLevel[indexPath.item].image
                buyingVC.nowDataOption = .L3
                delegate?.receiveIndexAndDataOption(index: buyingVC.indexPathOfItem!, optionNow: .L3)
                
                if Skill.thirdLevel[indexPath.item].haveOwned == true {
                    return
                } else {
                    present(buyingVC, animated: false)
                }
            }
        }
    }
}


extension StorePageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch dataOption {
            
        case .L1:
            return Skill.firstLevel.count
            
        case .L2:
            return Skill.secondLevel.count
            
        case .L3:
            return Skill.thirdLevel.count
        }
    }
    
    // 設定 CollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch layoutOption {
            
        case .list:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as! ListCollectionViewCell
            
            switch dataOption {
                
            case .L1:
                cell.setInformationForShop(information: Skill.firstLevel[indexPath.item])
                
            case .L2:
                cell.setInformationForShop(information: Skill.secondLevel[indexPath.item])
                
            case .L3:
                cell.setInformationForShop(information: Skill.thirdLevel[indexPath.item])
            }
            
            return cell
            
        case .grid:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCollectionViewCell
            
            switch dataOption {
                
            case .L1:
                cell.setInformationForShop(information: Skill.firstLevel[indexPath.item])
                
            case .L2:
                cell.setInformationForShop(information: Skill.secondLevel[indexPath.item])
                
            case .L3:
                cell.setInformationForShop(information: Skill.thirdLevel[indexPath.item])
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
            return CGSize(width: collectionView.frame.size.width / 2, height: 100)
            
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
