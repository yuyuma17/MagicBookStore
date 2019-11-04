//
//  HomePageViewController.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var currentMoney = 500
    let correctAnswer = [
        true,
        true,
        false,
        true,
        true,
        false,
        false
    ]
    
    var didInput = [Bool]() {
        didSet {
            if self.didInput.count == 8 {
                self.didInput.removeFirst()     // NG: O(n)
                print(self.didInput)
            }
            if self.didInput == correctAnswer {
                currentMoney += 100
                moneyLabel.text = "\(currentMoney)"
                return
            }
        }
    }
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyLabel.text = "\(currentMoney)"
    }
    
    @IBAction func aboveButton(_ sender: UIButton) {
        didInput.append(true)
    }
    
    @IBAction func belowButton(_ sender: UIButton) {
        didInput.append(false)
    }
}
