//
//  HomeVC.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 26/09/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var topRoundedView: UIView!
    @IBOutlet weak var silderCollectionView: UICollectionView!
    
    // MARK: - Variable
    var homeViewModel = HomeViewModel()
    
    // MARK: -
    init() {
        super.init(nibName: "HomeVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: - Helper Function
    private func setup() {
        self.setupUI()
        self.setupCollectionView()
        self.homeViewModel.homeViewDidLoad()
        self.bindData()
    }
    
    private func setupUI() {
        let dimensions = self.topRoundedView.frame.height
        self.topRoundedView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: dimensions / 2)
    }
    
    private func setupCollectionView() {
        self.silderCollectionView.delegate = self
        self.silderCollectionView.dataSource = self
        self.silderCollectionView.isPagingEnabled = true
        self.silderCollectionView.registerCell(cell: SilderCell.self)
    }
    
    func bindData() {
        self.homeViewModel.scrollToItemAt = { [weak self] indexPath in
            guard let self = self else { return }
            self.silderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        self.homeViewModel.itemDidFetch = { [weak self] in
            guard let self = self else { return }
            self.silderCollectionView.reloadData()
        }
    }
    
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeViewModel.numberOfSildes
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(indexPath: indexPath) as SilderCell
        cell.setupBackViewColor(UIColor.red)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.homeViewModel.didPressOnItem()
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
