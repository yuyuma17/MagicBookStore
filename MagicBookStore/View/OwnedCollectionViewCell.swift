//
//  OwnedCollectionViewCell.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class OwnedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var skillImage: UIImageView!
    @IBOutlet weak var coverView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setInformationForOwned(information: Skill) {
        
        if information.haveOwned == true {
            coverView.isHidden = true
        } else {
            coverView.isHidden = false
        }
        
        skillImage.image = information.image
    }
}
