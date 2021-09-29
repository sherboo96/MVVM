//
//  PopularTCell.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 29/09/2021.
//

import UIKit

class PopularTCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }

    // MARK: - Helper function
    private func setupUI() {
        self.selectionStyle = .none
    }
    
}

// MARK: - Setup Data
extension PopularTCell {
    func setupTitle(title: String) {
        self.lblTitle.text = title
    }
    
    func setupItemRating(rating: Int) {
        self.ratingView.configureWithRating(rating: rating, style: .compact)
    }
}
