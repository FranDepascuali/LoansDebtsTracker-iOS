//
//  MainViewController.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit

public class MainViewController: UIViewController {
    
    private let _viewModel: MainViewModel
    
    private let _viewControllers: [UIViewController]
    
    private var _view: MainView {
        return view as! MainView
    }
    
    public init(viewModel: MainViewModel) {
        _viewModel = viewModel
        _viewControllers = [LoansViewController(viewModel: viewModel.loansViewModel), DebtsViewController(viewModel: viewModel.debtsViewModel)]
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = MainView.loadFromNib()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        _view.tabBar.delegate = self
        displayControllerAt(0)
    }
}

extension MainViewController: UITabBarDelegate {
    
    public func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let index = tabBar.indexForItem(item)! // This should never be nil
        displayControllerAt(index)
    }
    
    private func displayControllerAt(index: Int) {
        _view.containerView.subviews.forEach { $0.removeFromSuperview() }
        _view.tabBar.selectItemAt(index)
        loadViewController(_viewControllers[index], into: _view.containerView)
    }
}