//
//  MoreVC.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import UIKit

class MoreVC: BaseWireFrame<MoreViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.main.navigate(to: .home)
    }


    override func bind(viewModel: MoreViewModel) {
        
    }

}
