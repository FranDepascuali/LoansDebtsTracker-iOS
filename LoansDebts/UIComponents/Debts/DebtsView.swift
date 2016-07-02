//
//  DebtsView.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public final class DebtsView: UIView {
    
    @IBOutlet weak var debtsTableView: UITableView!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clearColor()
    }
}