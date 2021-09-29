//
//  Navigator.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import Foundation
import UIKit

protocol Navigator {
    associatedtype Destination
    init(coordinator: Coodinator)
    var coodinator: Coodinator { get }
    func viewController(for destination: Destination) -> UIViewController
}

extension Navigator {
    func navigate(to destination: Destination) {
        let VC = self.viewController(for: destination)
        coodinator.navigationController?.pushViewController(VC, animated: true)
    }
}
