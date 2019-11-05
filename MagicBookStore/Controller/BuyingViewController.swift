//
//  BuyingViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class BuyingViewController: UIViewController {

    var selectedSkillPrice: Int?
    var selectedSkillImage: UIImage?
    var indexPathOfItem: Int?
    var nowDataOption: LayoutOption.DataOption?
    
    @IBOutlet weak var buyingWindow: UIView!
    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var skillPriceLabel: UILabel!
    @IBOutlet weak var tauntWindow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyingWindow.createViewBorder()
        tauntWindow.createViewBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        skillPriceLabel.text = "$ \(selectedSkillPrice!)"
        skillImage.image = selectedSkillImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        
        if UserData.money - selectedSkillPrice! < 0 {
            tauntWindow.isHidden = false
        } else if UserData.money - selectedSkillPrice! >= 0 {
            
            UserData.money = UserData.money - selectedSkillPrice!
            
            if nowDataOption == .L1 {
                Skill.firstLevel[indexPathOfItem!].haveOwned = true
            } else if nowDataOption == .L2 {
                Skill.secondLevel[indexPathOfItem!].haveOwned = true
            } else if nowDataOption == .L3 {
                Skill.thirdLevel[indexPathOfItem!].haveOwned = true
            }
            
            dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelTaunt(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
}

extension BuyingViewController: GetIndexAndDataOption {
    
    func receiveIndexAndDataOption(index: Int, optionNow: LayoutOption.DataOption) {
        indexPathOfItem = index
        nowDataOption = optionNow
    }
    
}
