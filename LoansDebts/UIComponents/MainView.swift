//
//  MainView.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public final class MainView: UIView {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .clearColor()
        }
    }
    
    @IBOutlet weak var tabBar: UITabBar!
    
}

