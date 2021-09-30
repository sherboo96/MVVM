//
//  MoreVCRouter.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import Foundation

protocol MoreVCRouterProtocol {
    var coordinator: Coodinator { get set}
    func presentEmptyScreen()
}

class MoreVCRouter: MoreVCRouterProtocol {
    
    var coordinator: Coodinator
    
    init(coordinator: Coodinator) {
        self.coordinator = coordinator
    }
    
    func presentEmptyScreen() {
        coordinator.main.navigate(to: .home, with: .push)
    }
}
