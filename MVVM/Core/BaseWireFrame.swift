//
//  BaseWireFrame.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class BaseWireFrame<ViewModel>: UIViewController {
    let viewModel: ViewModel!
    var coordinator: Coodinator
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    init(viewModel: ViewModel, coordinator: Coodinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind(viewModel: viewModel)
    }
    
    func bind(viewModel: ViewModel) {
        preconditionFailure("MVVM method 'bind' must be overriden for controller : \(String(describing: type(of: self)))")
    }
}
