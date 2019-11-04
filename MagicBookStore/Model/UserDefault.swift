//
//  UserDefault.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/4.
//  Copyright © 2019 Lacie. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    // MARK: - Static Properties
    static let manager = UserDefaultsWrapper()
    
    // MARK: - Internal getter methods
    func loadSavedMoney() -> Int? {
        return UserDefaults.standard.value(forKey: moneyKey) as? Int
    }
    
    // MARK: - Internal setter methods
    func save(moneyAmount: Int) {
        UserDefaults.standard.set(moneyAmount, forKey: moneyKey)
    }
    
    // MARK: - Private Properties
    private let moneyKey = "moneyKey"
}
