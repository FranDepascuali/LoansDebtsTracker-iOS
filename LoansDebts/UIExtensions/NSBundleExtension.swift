//
//  NSBundleExtension.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import Foundation

public extension NSBundle {
    
//    public func loadNib(identifier: NibIdentifier) -> AnyObject {
//        return self.loadNibNamed(identifier.rawValue, owner: self, options: nil)[0]
//    }
    
    public func loadNib(name: String) -> AnyObject {
        return self.loadNibNamed(name, owner: self, options: nil)[0]
    }
    
}

public enum ViewPositioning {
    case Back
    case Front
}
