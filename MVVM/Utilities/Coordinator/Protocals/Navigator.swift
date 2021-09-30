//
//  Navigator.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import Foundation
import UIKit

enum NavigatorType {
    case push
    case present
    case root
}

protocol Navigator {
    associatedtype Destination
    init(coordinator: Coodinator)
    var coodinator: Coodinator { get }
    func viewController(for destination: Destination) -> UIViewController
    func navigate(to destination: Destination, with navigatorType: NavigatorType)
}

extension Navigator {
    func navigate(to destination: Destination, with navigatorType: NavigatorType) {
        let VC = self.viewController(for: destination)
        switch navigatorType {
        case .push:
            coodinator.navigationController?.pushViewController(VC, animated: true)
        case .present:
            coodinator.navigationController?.present(VC, animated: true, completion: nil)
        case .root:
            coodinator.navigationController?.setViewControllers([VC], animated: true)
        }
    }
}
