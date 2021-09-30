//
//  ProductDetailsVCRouter.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import Foundation

protocol ProductDetailsVCRouterProtocol {
    var coordinator: Coodinator { get set}
    func presentEmptyScreen()
}

class ProductDetailsVCRouter: ProductDetailsVCRouterProtocol {
    
    var coordinator: Coodinator
    
    init(coordinator: Coodinator) {
        self.coordinator = coordinator
    }
    
    func presentEmptyScreen() {
        print("")
    }
}
