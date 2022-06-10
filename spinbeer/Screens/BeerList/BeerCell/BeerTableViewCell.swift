//
//  BeerTableViewCell.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var beerABVLabel: UILabel!
    @IBOutlet weak var beerIBULabel: UILabel!
    
    static let reuseIdentifier = "BeerTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        beerNameLabel.textColor = .black
        beerNameLabel.font = .boldSystemFont(ofSize: 16)
        beerDescriptionLabel.textColor = .darkGray
        beerDescriptionLabel.font = .italicSystemFont(ofSize: 14)
        beerImageView.layer.cornerRadius = 16
        beerImageView.clipsToBounds = true
        beerABVLabel.textColor = .lightGray
        beerABVLabel.font = .italicSystemFont(ofSize: 14)
        beerIBULabel.textColor = .lightGray
        beerIBULabel.font = .italicSystemFont(ofSize: 14)
        
    }
    
    func bind(with viewModel: BeerCellViewModel) {
        let url = URL(string: viewModel.image)
        beerImageView.kf.setImage(with: url)
        beerNameLabel.text = viewModel.name
        beerDescriptionLabel.text = viewModel.description
        beerABVLabel.text = ApplicationStrings.beerValueABV.localized() + "\(viewModel.abvText)"
        beerIBULabel.text = ApplicationStrings.beerValueIBU.localized() + "\(viewModel.ibuText)"
    }
    
}
