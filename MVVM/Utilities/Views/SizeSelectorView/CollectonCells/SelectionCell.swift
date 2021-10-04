//
//  SelectionCell.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 04/10/2021.
//

import UIKit

class SelectionCell: UICollectionViewCell {

    @IBOutlet weak var contextView: UIView!
    @IBOutlet weak var xView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.unSetupSelection()
    }
    
    
    func setupSelection() {
        self.contextView.borderWidth = 1
        self.xView.isHidden = false
    }
    
    func unSetupSelection() {
        self.contextView.borderWidth = 0
        self.xView.isHidden = true
    }
    
    override var isSelected: Bool {
        didSet {
            isSelected ? setupSelection() : unSetupSelection()
        }
    }
    
    @IBAction func didSelectTapped(_ sender: UIButton) {
        
    }
}
