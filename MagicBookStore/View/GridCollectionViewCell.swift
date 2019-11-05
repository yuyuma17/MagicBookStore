//
//  GridCollectionViewCell.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var coverView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setInformationForShop(information: Skill) {
        if information.haveOwned == true {
            coverView.isHidden = false
        } else {
            coverView.isHidden = true
        }
        skillImage.image = information.image
    }

}
