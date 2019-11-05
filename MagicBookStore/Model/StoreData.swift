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
    var haveOwned: Bool
    
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
    
    static var secondLevel: [Skill] = [

        Skill(name: "地獄之牙", price: 5000, image: UIImage(named: "magic-stalac"), haveOwned: false),
        Skill(name: "寒冷戰慄", price: 5000, image: UIImage(named: "magic-touch"), haveOwned: false),
        Skill(name: "擬似魔法武器", price: 5000, image: UIImage(named: "magic-enchant-weapon"), haveOwned: false),
        Skill(name: "毒咒", price: 5000, image: UIImage(named: "magic-curse-poison"), haveOwned: false),
        Skill(name: "火箭", price: 5000, image: UIImage(named: "magic-fire-arrow"), haveOwned: false),
        Skill(name: "無所遁形術", price: 5000, image: UIImage(named: "magic-detection"), haveOwned: false),
        Skill(name: "解毒術", price: 5000, image: UIImage(named: "magic-cure-posion"), haveOwned: false),
        Skill(name: "負重強化", price: 5000, image: UIImage(named: "magic-decrease-weight"), haveOwned: false)

    ]
    
    static var thirdLevel: [Skill] = [

        Skill(name: "中級治癒術", price: 10000, image: UIImage(named: "magic-medium-heal"), haveOwned: false),
        Skill(name: "寒冷氣息", price: 10000, image: UIImage(named: "magic-frozen-cloud"), haveOwned: false),
        Skill(name: "極光雷電", price: 10000, image: UIImage(named: "magic-lightning"), haveOwned: false),
        Skill(name: "能量感測", price: 10000, image: UIImage(named: "magic-reveal-elemental"), haveOwned: false),
        Skill(name: "起死回生術", price: 10000, image: UIImage(named: "magic-turn-undead"), haveOwned: false),
        Skill(name: "鎧甲護持", price: 10000, image: UIImage(named: "magic-blessed-armor"), haveOwned: false),
        Skill(name: "闇盲咒術", price: 10000, image: UIImage(named: "magic-curse-Blind"), haveOwned: false),
        Skill(name: "冥想術", price: 10000, image: UIImage(named: "maigc--meditation"), haveOwned: false)

    ]
}
