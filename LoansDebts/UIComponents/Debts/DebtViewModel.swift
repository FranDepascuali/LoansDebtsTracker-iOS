//
//  DebtViewModel.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 6/16/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import Foundation

public final class DebtViewModel {
    
    private let _debt: Debt
    
    public init(debt: Debt) {
        _debt = debt
    }

}

public extension DebtViewModel {
    
    public var moneyOwner: String {
        return _debt.moneyOwner
    }
    
    public var amountLabel: String {
        return "$\(_debt.amount)"
    }
}