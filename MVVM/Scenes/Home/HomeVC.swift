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
    var arrSilder = [1, 2, 3, 4]
    var silderTimer: Timer?
    var currentSilde = 0
    
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
        self.setupSilder()
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
    
    private func setupSilder() {
        self.silderTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollToNextSilde), userInfo: nil, repeats: true)
    }
    
    // MARK: - IBAction Function
    @objc
    func scrollToNextSilde() {
        let nextSilde = currentSilde + 1
        self.currentSilde = nextSilde % self.arrSilder.count
        let indexPath = IndexPath(item: self.currentSilde, section: 0)
        self.silderCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrSilder.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(indexPath: indexPath) as SilderCell
        cell.setupBackViewColor(UIColor.red)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped on \(indexPath.row)")
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
