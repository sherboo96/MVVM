//
//  CustomTabBarController.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarItems()
    }
    
    
    private func setupTabBarItems() {
        self.viewControllers = TabBarItems.allCases.map({viewControllerForTabItem($0)})
    }
    
    func viewControllerForTabItem(_ item: TabBarItems) -> UIViewController {
        switch item {
        case .Home:
            let VC =  HomeVC(backColor: .red)
            VC.tabBarItem = tabBarItem(item)
            return VC
        case .Middle:
            let VC =  HomeVC(backColor: .gray)
            VC.tabBarItem = tabBarItem(item)
            return VC
        case .Menu:
            let VC =  HomeVC(backColor: .green)
            VC.tabBarItem = tabBarItem(item)
            return VC
        }
    }
    
    private func tabBarItem(_ item: TabBarItems) -> UITabBarItem {
        var tabBarItem: UITabBarItem
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        case .Middle:
            tabBarItem = .init(title: "Home", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        case .Menu:
            tabBarItem = .init(title: "Home", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        }
        return tabBarItem
    }
    
    enum TabBarItems: CaseIterable {
        case Home
        case Middle
        case Menu
    }
}
