//
//  SilderCell.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 26/09/2021.
//

import UIKit

class SilderCell: UICollectionViewCell {

    // MARK: - IBOutlet Function
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var sellButton: UIButton!
    
    // MARK: - Variable
    var sellNow: (()->())?
    
    // MARK: - Cell LC
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    // MARK: - Helper Function
    private func setupUI() {
        self.sellButton.roundCorners(corners: [.bottomRight, .topRight], radius: 10)
    }
    
    
    // MARK: - IBAction Function
    @IBAction func sellNowTapped(_ sender: UIButton) {
        self.sellNow?()
    }
    

}

// MARK: - Set up Data
extension SilderCell {
    func setupBackViewColor(_ color: UIColor) {
        self.backView.backgroundColor = color
    }
    
    func setProductName(name: String) {
        self.lblProductName.text = name
    }
}
