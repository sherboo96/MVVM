//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 27/09/2021.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    // MARK: - Variable
    var arrSilder: BehaviorRelay<[Int]> = .init(value: [1, 2])
    var silderTimer: Timer?
    var currentSilde = 0
    
    // MARK: - Output
    var scrollToItemIdx: PublishSubject<IndexPath> = .init()
    
    var numberOfSildes: Int {
        return arrSilder.value.count
    }
    
    func homeViewDidLoad() {
        self.setupSilder()
    }
    
    func setupSilder() {
        self.silderTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollToNextSilde), userInfo: nil, repeats: true)
    }
    
    func didSelectItem() {
        arrSilder.accept([1, 2, 3,4 ,5])
    }
    
    // MARK: - Action Function
    @objc
    func scrollToNextSilde() {
        let nextSilde = currentSilde + 1
        self.currentSilde = nextSilde % self.arrSilder.value.count
        let indexPath = IndexPath(item: self.currentSilde, section: 0)
        self.scrollToItemIdx.onNext(indexPath)
    }
}
