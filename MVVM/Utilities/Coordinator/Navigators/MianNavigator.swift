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
        case more
        case dummy
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
        case .more:
            let moreRouter: MoreVCRouterProtocol = MoreVCRouter(coordinator: coodinator)
            let moreViewModel = MoreViewModel()
            let VC = MoreVC(viewModel: moreViewModel, router: moreRouter)
            return VC
        case .dummy:
            let view = UIViewController()
            view.view.backgroundColor = .yellow
            return view
        }
    }
    
}
