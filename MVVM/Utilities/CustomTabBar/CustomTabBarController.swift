//
//  CustomTabBarController.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    lazy var middleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setImage(UIImage(named: "More"), for: .normal)
        return button
    }()
    
    var appCoordinator: Coodinator
    
    init(appCoordinator: Coodinator) {
        self.appCoordinator = appCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomTabBar(), forKey: "TabBar")
        self.setupTabBarItems()
        self.setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.middleButton.layer.cornerRadius = 25
    }
    
    private func setupTabBarItems() {
        self.viewControllers = TabBarItems.allCases.map({
            let VC = viewControllerForTabItem($0)
            let navigateController = UINavigationController(rootViewController: VC)
            return navigateController
        })
    }
    
    func setupUI() {
        self.tabBar.tintColor = .green
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.items?[TabBarItems.Middle.rawValue].isEnabled = false
        self.addMiddleButton()
    }
    
    private func addMiddleButton() {
        tabBar.addSubview(self.middleButton)
        self.middleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.middleButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.middleButton.centerYAnchor.constraint(equalTo: self.tabBar.centerYAnchor, constant: -30),
            self.middleButton.heightAnchor.constraint(equalToConstant: 50),
            self.middleButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        self.middleButton.addTarget(self, action: #selector(selectCenterTap), for: .touchUpInside)
    }
    
    func viewControllerForTabItem(_ item: TabBarItems) -> UIViewController {
        switch item {
        case .Home:
            let VC = appCoordinator.main.viewController(for: .home)
            VC.tabBarItem = tabBarItem(item)
            return VC
        case .Middle:
            let VC = UIViewController()
            return VC
        case .Menu:
            let VC = appCoordinator.main.viewController(for: .more)
            VC.tabBarItem = tabBarItem(item)
            return VC
        }
    }
    
    private func tabBarItem(_ item: TabBarItems) -> UITabBarItem? {
        var tabBarItem: UITabBarItem?
        switch item {
        case .Home:
            tabBarItem = .init(title: "Home", image: UIImage(named: "More"), selectedImage: UIImage(named: "More"))
        case .Middle:
            return nil
        case .Menu:
            tabBarItem = .init(title: "More", image: UIImage(named: "More"), selectedImage: UIImage(named: "More"))
        }
        tabBarItem?.titlePositionAdjustment = .init(horizontal: 0, vertical: 5)
        return tabBarItem
    }
    
    @objc
    func selectCenterTap() {
        self.selectedIndex = TabBarItems.Middle.rawValue
    }
    
    enum TabBarItems: Int, CaseIterable {
        case Home
        case Middle
        case Menu
    }
}
