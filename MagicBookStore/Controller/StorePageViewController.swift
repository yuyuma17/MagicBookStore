//
//  StorePageViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class StorePageViewController: UIViewController {

    @IBOutlet weak var levelOneMagic: UIButton!
    @IBOutlet weak var levelTwoMagic: UIButton!
    @IBOutlet weak var levelThreeMagic: UIButton!
    @IBOutlet weak var detailArrangement: UIButton!
    @IBOutlet weak var waterFallArrangement: UIButton!
    @IBOutlet weak var currentMoneyView: UIView!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
