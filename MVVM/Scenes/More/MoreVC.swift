//
//  MoreVC.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import UIKit

class MoreVC: BaseWireFrame<MoreViewModel, MoreVCRouterProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()
        router.presentEmptyScreen()
    }

    override func bind(viewModel: MoreViewModel) {
        
    }

}
