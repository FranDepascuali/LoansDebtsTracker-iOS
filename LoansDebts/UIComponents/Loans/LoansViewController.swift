//
//  LoansViewController.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public final class LoansViewController: UIViewController {
    
    private let _viewModel: LoansViewModel
    
    private var _view: LoansView {
        return view as! LoansView
    }
    
    public init(viewModel: LoansViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = LoansView.loadFromNib()
    }
    
}