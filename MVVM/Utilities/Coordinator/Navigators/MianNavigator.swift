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
            let homeViewModel = HomeViewModel()
            let VC = HomeVC(viewModel: homeViewModel, coordinator: coodinator)
            return VC
        case .more:
            let moreViewModel = MoreViewModel()
            let VC = MoreVC(viewModel: moreViewModel, coordinator: coodinator)
            return VC
        case .dummy:
            let view = UIViewController()
            view.view.backgroundColor = .yellow
            return view
        }
    }
    
}
