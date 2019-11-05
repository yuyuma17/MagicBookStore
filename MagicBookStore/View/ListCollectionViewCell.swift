//
//  ListCollectionViewCell.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var skillName: UILabel!
    @IBOutlet weak var skillPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setInformation(information: Skill) {
        skillImage.image = information.image
        skillName.text = information.name
        skillPrice.text = "$ \(information.price)"
    }
    
}
