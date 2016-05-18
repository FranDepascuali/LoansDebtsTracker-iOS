//
//  UIViewExtension.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Loads the nib for the specific view , it will use the view name as the xib name.
    ///
    /// - parameter bundle: Specific bundle, default = mainBundle.
    /// - returns: The loaded UIView
    public static func loadFromNib<T: UIView>(bundle: NSBundle = NSBundle.mainBundle()) -> T {
        let nibName = NSStringFromClass(self).componentsSeparatedByString(".").last!
        return bundle.loadNibNamed(nibName, owner: self, options: nil).first as! T // swiftlint:disable:this force_cast
    }
    
    /// Loads the view into the specified containerView.
    ///
    /// It can be done after self's view is initialized, as it uses constraints to determine the size.
    ///
    /// - parameter containerView: The container view.
    /// - parameter viewPositioning: Back or Front. Default: Front
    public func loadInto(containerView: UIView, viewPositioning: ViewPositioning = .Front) {
        containerView.addSubview(self)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        containerView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        containerView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        containerView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        
        if case viewPositioning = ViewPositioning.Back {
            containerView.sendSubviewToBack(self)
        }
    }
    
}
