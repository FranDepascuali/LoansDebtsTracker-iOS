//
//  ArrayExtension.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import Foundation

public extension Array {
    
    func filterFirst(condition: Element -> Bool) -> Element? {
        return indexOf(condition).map { self[$0] }
    }
    
}