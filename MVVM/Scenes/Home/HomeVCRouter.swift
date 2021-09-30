//
//  HomeVCRouter.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import Foundation

protocol HomeVCRouterProtocol {
    var coordinator: Coodinator { get set}
    func presentEmptyScreen()
    func navigateToProductDetail(_ product: Product)
}

class HomeVCRouter: HomeVCRouterProtocol {
    
    var coordinator: Coodinator
    
    init(coordinator: Coodinator) {
        self.coordinator = coordinator
    }
    
    func presentEmptyScreen() {
        self.coordinator.main.navigate(to: .more, with: .present)
    }
    
    func navigateToProductDetail(_ product: Product) {
        self.coordinator.main.navigate(to: .details(product: product), with: .push)
    }
}
