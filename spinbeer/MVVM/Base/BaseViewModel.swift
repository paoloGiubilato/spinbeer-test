//
//  BaseViewModel.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit

class BaseViewModel<C: CoordinatorProtocol> {
    
    var coordinator: C?
    
    required init(with coordinator: C) {
        self.coordinator = coordinator
        fetchData()
    }
    
    func fetchData() {}
}
