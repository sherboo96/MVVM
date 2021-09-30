//
//  ProductViewModel.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 30/09/2021.
//

import Foundation

class ProductViewModel {
    
    let mainTitle: String
    
    init(_ product: Product) {
        self.mainTitle = "Product Title: \(product.name)"
    }
}
