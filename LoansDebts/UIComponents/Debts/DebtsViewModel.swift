//
//  DebtsViewModel.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 5/17/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import ReactiveCocoa
import enum Result.NoError

public final class DebtsViewModel {
    
    private var _debtsViewModels: MutableProperty<[DebtViewModel]> = MutableProperty([])
    
    private let _paginationService: PaginationService<Debt>
    
    public init(paginationService: PaginationService<Debt> = MockedPaginationService) {
        _paginationService = paginationService
    }
    
    public func fetchNewPage() -> SignalProducer<(), NoError> {
        let appendNewValues: [Debt] -> () = { [unowned self] in self._debtsViewModels.value.appendContentsOf($0.map(DebtViewModel.init)) }
        
        return _paginationService
            .fetchNextPage(10)
            .on(next: appendNewValues)
            .map { _ in () }
    }
    
    public subscript(position: Int) -> DebtViewModel {
        return _debtsViewModels.value[position]
    }
    
    public var numberOfItems: Int {
        return _debtsViewModels.value.count
    }
}

let MockedPaginationProducer: PaginationService<Debt>.ElementProvider = { _, _ in SignalProducer(values: [MockedDebts]) }

let MockedPaginationService: PaginationService<Debt> = PaginationService(elementProvider: MockedPaginationProducer)

let MockedDebts = _MockedDebts + _MockedDebts

let _MockedDebts = [Debt(moneyOwner: "mom", amount: 20), Debt(moneyOwner: "jack", amount: 30)]