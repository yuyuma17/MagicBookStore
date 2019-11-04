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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelOneMagic.createBorder()
    }

    
}

extension UIButton {
    func createBorder() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
}
