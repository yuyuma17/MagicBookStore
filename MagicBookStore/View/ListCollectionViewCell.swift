//
//  ListCollectionViewCell.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var skillPrice: UILabel!
    @IBOutlet weak var coverView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        basicView.createViewBorder()
    }

    func setInformationForShop(information: Skill) {
        
        if information.haveOwned == true {
            coverView.isHidden = false
        } else {
            coverView.isHidden = true
        }
        
        skillImage.image = information.image
        skillName.text = information.name
        skillPrice.text = "$ \(information.price)"
    }
}
