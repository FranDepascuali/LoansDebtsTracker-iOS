//
//  DefaultCell.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 6/16/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public final class DefaultCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var deleteButton: UILabel!
    
    public func bindViewModel(viewModel: DebtViewModel) {
        nameLabel.text = viewModel.moneyOwner
        amountLabel.text = viewModel.amountLabel
    }
}