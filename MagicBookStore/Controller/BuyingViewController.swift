//
//  BuyingViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class BuyingViewController: UIViewController {

    var currentMoney: Int?
    
    @IBOutlet weak var buyingWindow: UIView!
    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var skillPrice: UILabel!
    @IBOutlet weak var tauntWindow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyingWindow.createViewBorder()
        tauntWindow.createViewBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 讀取存的錢
         if let savedMoney = UserDefaultsWrapper.manager.loadSavedMoney() {
             currentMoney = savedMoney
         }
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        if currentMoney! - Int(skillPrice.text!)! < 0 {
            tauntWindow.isHidden = false
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelTaunt(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
}
