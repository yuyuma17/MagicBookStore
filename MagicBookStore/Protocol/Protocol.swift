//
//  Protocol.swift
//  MagicBookStore
//
//  Created by 黃士軒 on 2019/11/5.
//  Copyright © 2019 Lacie. All rights reserved.
//

import Foundation

protocol GetIndexAndDataOption: AnyObject {
    func receiveIndexAndDataOption(index: Int, optionNow: LayoutOption.DataOption)
}
