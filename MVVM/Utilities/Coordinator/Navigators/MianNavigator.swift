//
//  MianNavigator.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import Foundation
import UIKit

class MianNavigator: Navigator {
    
    var coodinator: Coodinator
    
    enum Destination {
        case home
        case details(product: Product)
        case more
    }
    
    required init(coordinator: Coodinator) {
        self.coodinator = coordinator
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .home:
            let homeRouter: HomeVCRouterProtocol = HomeVCRouter(coordinator: coodinator)
            let homeViewModel = HomeViewModel()
            let VC = HomeVC(viewModel: homeViewModel, router: homeRouter)
            return VC
        case .details(let product):
            let productDetailsRouter: ProductDetailsVCRouterProtocol = ProductDetailsVCRouter(coordinator: coodinator)
            let productDetailsViewModel = ProductDetailsViewModel(prodcut: product)
            let VC = ProductDetailsVC(viewModel: productDetailsViewModel, router: productDetailsRouter)
            return VC
        case .more:
            let moreRouter: MoreVCRouterProtocol = MoreVCRouter(coordinator: coodinator)
            let moreViewModel = MoreViewModel()
            let VC = MoreVC(viewModel: moreViewModel, router: moreRouter)
            return VC
        }
    }
    
}
