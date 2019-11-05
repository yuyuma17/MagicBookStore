//
//  StoreData.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit
import Foundation

struct Skill {
    
    let name: String
    let price: Int
    let image: UIImage?
    let haveOwned: Bool
    
}

extension Skill {
    
    static var firstLevel: [Skill] = [
        
        Skill(name: "保護罩", price: 1000, image: UIImage(named: "magic-shield"), haveOwned: false),
        Skill(name: "光箭", price: 1000, image: UIImage(named: "magic-bolt"), haveOwned: false),
        Skill(name: "冰箭", price: 1000, image: UIImage(named: "magic-ice-dagger"), haveOwned: false),
        Skill(name: "初級治癒術", price: 1000, image: UIImage(named: "magic-heal"), haveOwned: false),
        Skill(name: "指定傳送", price: 1000, image: UIImage(named: "magic-teleport"), haveOwned: false),
        Skill(name: "日光術", price: 1000, image: UIImage(named: "magic-light"), haveOwned: false),
        Skill(name: "神聖武器", price: 1000, image: UIImage(named: "magic-holly-weapen"), haveOwned: false),
        Skill(name: "風刃", price: 1000, image: UIImage(named: "magic-wind"), haveOwned: false)
        
    ]
    
//    static var secondLevel: [Skill] = [
//
//        Skill(name: "保護罩", price: 1000, image: UIImage(named: "magic-shield"), haveOwned: false),
//        Skill(name: "光箭", price: 1000, image: UIImage(named: "magic-bolt"), haveOwned: false),
//        Skill(name: "冰箭", price: 1000, image: UIImage(named: "magic-ice-dagger"), haveOwned: false),
//        Skill(name: "初級治癒術", price: 1000, image: UIImage(named: "magic-heal"), haveOwned: false),
//        Skill(name: "指定傳送", price: 1000, image: UIImage(named: "magic-teleport"), haveOwned: false),
//        Skill(name: "日光術", price: 1000, image: UIImage(named: "magic-light"), haveOwned: false),
//        Skill(name: "神聖武器", price: 1000, image: UIImage(named: "magic-holly-weapen"), haveOwned: false),
//        Skill(name: "風刃", price: 1000, image: UIImage(named: "magic-wind"), haveOwned: false)
//
//    ]
}
