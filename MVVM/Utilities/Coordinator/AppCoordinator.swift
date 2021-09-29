//
//  AppCoordinator.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import Foundation
import UIKit
import RxSwift

protocol Coodinator {
    var main: MianNavigator { get }
    var navigationController: UINavigationController? { get }
}

class AppCoordinator: Coodinator {
    let window: UIWindow
    lazy var main: MianNavigator = {
        return .init(coordinator: self)
    }()
    
    lazy var customTabBarController: CustomTabBarController = {
        return CustomTabBarController(appCoordinator: self)
    }()
    
    var navigationController: UINavigationController? {
        if let navigationController = customTabBarController.selectedViewController as? UINavigationController {
            return navigationController
        }
        return nil
    }
    
    init(window: UIWindow = UIWindow()) {
        self.window = window
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController: UIViewController {
        return customTabBarController
    }
}
