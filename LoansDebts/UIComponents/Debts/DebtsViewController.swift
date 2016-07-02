//
//  DebtsViewController.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import UIKit
import ReactiveCocoa

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
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        _view.debtsTableView.registerNib(UINib(nibName: "DefaultCell", bundle: nil), forCellReuseIdentifier: "DefaultCell")
        _view.debtsTableView.dataSource = self
        _view.debtsTableView.delegate = self
        
        // This is for mocked values
        _viewModel.fetchNewPage().startWithNext { [unowned self] _ in
            self._view.debtsTableView.reloadData()
        }
    
    }
}

extension DebtsViewController: UITableViewDelegate {
    
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let isLastElement: Bool = { indexPath.row == tableView.numberOfRowsInSection(0) - 1 }()
        
        if isLastElement {
            _viewModel.fetchNewPage().startWithNext { [unowned self] _ in
                self._view.debtsTableView.reloadData()
            }
        }
    }
}

extension DebtsViewController: UITableViewDataSource {
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.numberOfItems
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultCell") as! DefaultCell
        let cellViewModel = _viewModel[indexPath.row]
        cell.bindViewModel(cellViewModel)
        return cell
    }
}

