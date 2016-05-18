//
//  UITabBarExtension.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public extension UITabBar {
    
    public func indexForItem(item: UITabBarItem) -> Int? {
        for (index, _item) in items!.enumerate() {
            if _item == item {
                return index
            }
        }
        return nil
    }
    
    public func selectItemAt(index: Int) {
        selectedItem = items![index]
    }
}