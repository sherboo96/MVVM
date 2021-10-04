//
//  SelectionViewModel.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 05/10/2021.
//

import Foundation

struct SelectionViewModel {
    
    var name: String
    
    init(select: Selection) {
        self.name = select.name
    }
    
}
