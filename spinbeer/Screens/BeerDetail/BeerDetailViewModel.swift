//
//  BeerDetailViewModel.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit

class BeerDetailViewModel: BaseViewModel<ApplicationCoordinator> {

    let selectedBeer: Beer
    var dataLoaded: (() -> Void)?
    
    init(coordinator: ApplicationCoordinator, selectedBeer: Beer) {
        self.selectedBeer = selectedBeer
        super.init(with: coordinator)
    }
    
    required init(with coordinator: ApplicationCoordinator) {
        fatalError("init(with:) implemented with selected beer")
    }
    
    var title: String {
        selectedBeer.name ?? ApplicationStrings.valueNotValid.localized()
    }
    
    func beerBrewersTips() -> String {
        return "\(ApplicationStrings.beerDetailsValueBrewerTips.localized())" + (selectedBeer.brewers_tips ?? ApplicationStrings.valueNotValid.localized())
    }
    
    func firstBrewedInfo() -> String {
        return "\(ApplicationStrings.beerDetailsValueFirstBrew.localized())" + (selectedBeer.first_brewed ?? ApplicationStrings.valueNotValid.localized())
    }
    
    func foodPairingInfo() -> String {
        return "\(ApplicationStrings.beerDetailsValuePairingInfo.localized())" + (selectedBeer.food_pairing?.joined(separator: " \(ApplicationStrings.commonOR.localized()) ") ?? ApplicationStrings.valueNotValid.localized())
    }
    
}
