//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 27/09/2021.
//

import Foundation

class HomeViewModel {
    // MARK: - Variable
    private var arrSilder = [1] {
        didSet {
            itemDidFetch?()
        }
    }
    var silderTimer: Timer?
    var currentSilde = 0
    
    // MARK: - Output
    var scrollToItemAt: ((IndexPath)->())?
    var itemDidFetch: (()->())?
    
    var numberOfSildes: Int {
        return arrSilder.count
    }
    
    func homeViewDidLoad() {
        self.setupSilder()
    }
    
    func setupSilder() {
        self.silderTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollToNextSilde), userInfo: nil, repeats: true)
    }
    
    func fetchData() {
        self.arrSilder.append(2)
        self.arrSilder.append(3)
        self.arrSilder.append(4)
    }
    
    func didPressOnItem() {
        self.fetchData()
    }
    
    // MARK: - Action Function
    @objc
    func scrollToNextSilde() {
        let nextSilde = currentSilde + 1
        self.currentSilde = nextSilde % self.arrSilder.count
        let indexPath = IndexPath(item: self.currentSilde, section: 0)
        self.scrollToItemAt?(indexPath)
    }
}
