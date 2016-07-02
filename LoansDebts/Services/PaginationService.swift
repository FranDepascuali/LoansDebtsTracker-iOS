//
//  PaginationService.swift
//  LoansDebts
//
//  Created by Francisco Depascuali on 7/1/16.
//  Copyright © 2016 DepaStudios. All rights reserved.
//

import ReactiveCocoa
import enum Result.NoError

public protocol PaginationServiceType {
    
    associatedtype Element
    
    init(elementProvider: (page: Int, numberOfElements: Int) -> SignalProducer<[Element], NoError>)
    
    func fetchNextPage(numberOfElements: Int) -> SignalProducer<[Element], NoError>
    
}

public final class PaginationService<ElementType>: PaginationServiceType {
    
    public typealias ElementProvider = (page: Int, numberOfElements: Int) -> SignalProducer<[ElementType], NoError>
    
    private let _elementProvider: ElementProvider
    
    private let _currentPage = MutableProperty(0)
    
    public init(elementProvider: ElementProvider) {
        _elementProvider = elementProvider
    }
    
    public func fetchNextPage(numberOfElements: Int) -> SignalProducer<[ElementType], NoError> {
        let updateCurrentPage: [ElementType] -> () = { [unowned self] _ in
            self._currentPage.value = self._currentPage.value + 1
        }
        
        return _elementProvider(page: _currentPage.value, numberOfElements: numberOfElements)
            .on(next: updateCurrentPage)
    }
    
}