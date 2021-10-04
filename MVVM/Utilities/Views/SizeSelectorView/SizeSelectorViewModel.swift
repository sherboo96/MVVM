//
//  SizeSelectorViewModel.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 04/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

protocol SizeSelectorViewModelInput {
    var didSelectItem: PublishSubject<SelectionViewModel> { get set}
}

protocol SizeSelectorViewModelOutput {
    var itemsDidChange: Observable<[SelectionViewModel]> { get }
}

class SizeSelectorViewModel: SizeSelectorViewModelInput & SizeSelectorViewModelOutput {
    
    var input: SizeSelectorViewModelInput {
        return self
    }
    
    var output: SizeSelectorViewModelOutput {
        return self
    }
    
    private var arrSelection: BehaviorRelay<[Selection]> = .init(value: [.init(id: 1, name: "one", imageURL: "one"), .init(id: 1, name: "two", imageURL: "two")])
    private var arSelection: BehaviorRelay<[SelectionViewModel]> = .init(value: [])
    var itemsDidChange: Observable<[SelectionViewModel]>
    var didSelectItem: PublishSubject<SelectionViewModel> = .init()
    
    init() {
        self.itemsDidChange = arSelection.asObservable()
        let newArraySelection = arrSelection.value.map { item in
            return SelectionViewModel(select: item)
        }
        arSelection.accept(newArraySelection)
    }
    
    func didSelectCell(indexPath: IndexPath) {
        self.didSelectItem.onNext(arSelection.value[indexPath.row])
    }
    
}
