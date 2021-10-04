//
//  NibLoadView.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 04/10/2021.
//

import UIKit

@IBDesignable
class NibLoadingView: UIView {
    
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupNib()
    }
    
    private func setupNib() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let type = type(of: self)
        let bundle = Bundle(for: type)
        let nib = UINib(nibName: String(describing: type), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
}
