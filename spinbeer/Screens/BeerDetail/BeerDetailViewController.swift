//
//  BeerDetailViewController.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit

class BeerDetailViewController: BaseViewController<BeerDetailViewModel> {

    lazy var beerBrewerTipsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    lazy var beerfirstBrewedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var beerFoodPairingInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func buildUI() {
        view.addSubview(beerBrewerTipsLabel)
        view.addSubview(beerfirstBrewedLabel)
        view.addSubview(beerFoodPairingInfoLabel)
        
        NSLayoutConstraint.activate([
            beerfirstBrewedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            beerfirstBrewedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            beerfirstBrewedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            beerBrewerTipsLabel.topAnchor.constraint(equalTo: beerfirstBrewedLabel.bottomAnchor, constant: 20),
            beerBrewerTipsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            beerBrewerTipsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            beerFoodPairingInfoLabel.topAnchor.constraint(equalTo: beerBrewerTipsLabel.bottomAnchor, constant: 20),
            beerFoodPairingInfoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            beerFoodPairingInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        ])
        
        title = vm.title
        beerfirstBrewedLabel.text = vm.firstBrewedInfo()
        beerBrewerTipsLabel.text = vm.beerBrewersTips()
        beerFoodPairingInfoLabel.text = vm.foodPairingInfo()
    }

}
