//
//  HomeVC.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 26/09/2021.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: BaseWireFrame<HomeViewModel> {
    
    // MARK: - IBOutlet
    @IBOutlet weak var topRoundedView: UIView!
    @IBOutlet weak var silderCollectionView: UICollectionView!
    @IBOutlet weak var popularTableView: UITableView!
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: - Helper Function
    private func setup() {
        self.setupUI()
        self.registerCells()
        self.viewModel.homeViewDidLoad()
        self.setupSilderCollectionView()
        self.setupPopularTableView()
    }
    
    private func setupUI() {
        coordinator.main.navigate(to: .dummy)
        let dimensions = self.topRoundedView.frame.height
        self.topRoundedView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: dimensions / 2)
        self.silderCollectionView.isPagingEnabled = true
    }
    
    private func registerCells() {
        self.silderCollectionView.registerCell(cell: SilderCell.self)
        self.popularTableView.registerCell(cell: PopularTCell.self)
    }
    
    func setupSilderCollectionView() {
        self.silderCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        self.viewModel.arrSilder.asObservable()
            .bind(to: silderCollectionView.rx.items(cellIdentifier: String(describing: SilderCell.self), cellType: SilderCell.self)) { index, model, cell in
                cell.setProductName(name: "\(model)")
                cell.setupRatingView(rating: 5)
            }.disposed(by: disposeBag)
    }
    
    func setupPopularTableView() {
        self.popularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        self.viewModel.arrProduct.asObservable()
            .bind(to: self.popularTableView.rx.items(cellIdentifier: String(describing: PopularTCell.self), cellType: PopularTCell.self)) { index, model, cell in
                cell.setupItemRating(rating: 1)
                cell.setupTitle(title: model.name ?? "")
            }.disposed(by: disposeBag)
    }
    
    override func bind(viewModel: HomeViewModel) {
        self.viewModel.scrollToItemIdx.subscribe { indexPath in
            self.silderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }.disposed(by: disposeBag)
        
        self.viewModel.arrSilder.subscribe { _ in
            self.silderCollectionView.reloadData()
        }.disposed(by: disposeBag)
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return silderCollectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
