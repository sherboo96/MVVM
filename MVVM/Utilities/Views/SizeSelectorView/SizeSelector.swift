//
//  SizeSelector.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 04/10/2021.
//

import UIKit
import RxSwift
import RxCocoa

class SizeSelector: NibLoadingView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = SizeSelectorViewModel()
    lazy var disposeBag: DisposeBag = {
        return DisposeBag()
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    func setup() {
        self.bind()
        self.bindCollectionView()
        self.setupCollection()
    }
    
    private func setupCollection() {
        self.registerCell()
        self.collectionView.allowsMultipleSelection = true
    }
    
    private func registerCell() {
        self.collectionView.registerCell(cell: SelectionCell.self)
    }

    func bind() {
        self.viewModel.didSelectItem.subscribe { [weak self] item in
            guard let self = self, let item = item.element else { return }
            print(item.name)
        }.disposed(by: disposeBag)
    }
    
    
    func bindCollectionView() {
        
        self.collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        self.viewModel.output.itemsDidChange
            .bind(to: self.collectionView.rx.items(cellIdentifier: String(describing: SelectionCell.self), cellType: SelectionCell.self)) { index, model, cell in
        }.disposed(by: disposeBag)
        self.collectionView.rx.itemSelected.subscribe(onNext: { indexPath in
            self.viewModel.didSelectCell(indexPath: indexPath)
        }).disposed(by: disposeBag)
    }
}

extension SizeSelector: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width / 2 - 20, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
