//
//  ProductDetailsViewModel.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol ProductDetailsViewModelOutput {
    var productToDispaly: PublishSubject<ProductViewModel> { get set }
}

protocol ProductDetailsViewModelInput {
    func viewDidLoad()
}

class ProductDetailsViewModel: ViewModelProtocal, ProductDetailsViewModelInput, ProductDetailsViewModelOutput {
    
    var prodcut: Product!
    
    //Output
    var productToDispaly: PublishSubject<ProductViewModel> = .init()
    
    init(prodcut: Product) {
        self.prodcut = prodcut
    }
    
    func viewDidLoad() {
        let _product = ProductViewModel(prodcut)
        productToDispaly.onNext(_product)
    }
}
