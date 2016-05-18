//
//  DebtsViewController.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public final class DebtsViewController: UIViewController {
    
    private let _viewModel: DebtsViewModel
    
    private var _view: DebtsView {
        return view as! DebtsView
    }
    
    public init(viewModel: DebtsViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = DebtsView.loadFromNib()
    }
}