//
//  MainView.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public final class MainView: UIView {
    
    @IBOutlet weak var titleView: UIView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = "Loans & Debts Tracker"
        }
    }
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .clearColor()
        }
    }
    
    @IBOutlet weak var tabBar: UITabBar!
    
}

