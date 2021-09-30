//
//  ProductDetailsVC.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import UIKit

class ProductDetailsVC: BaseWireFrame<ProductDetailsViewModel, ProductDetailsVCRouterProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.viewModel.viewDidLoad()
    }
    
    override func bind(viewModel: ProductDetailsViewModel) {
        self.viewModel.productToDispaly.subscribe { [weak self] productViewModel in
            guard let self = self, let productViewModel = productViewModel.element else { return }
            self.setupProductView(productViewModel: productViewModel)
        }.disposed(by: disposeBag)
    }
    
    func setupProductView(productViewModel: ProductViewModel) {
        self.title = productViewModel.mainTitle
    }
}
