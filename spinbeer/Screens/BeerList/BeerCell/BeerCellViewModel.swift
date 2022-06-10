//
//  BeerCellViewModel.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import Foundation

struct BeerCellViewModel {
    let name: String
    let description: String
    let abv: Double?
    let ibu: Double?
    let imageUrl: String?
    
    var abvText: String {
        if let abvValue = abv {
            return String(abvValue)
        }
        return ApplicationStrings.valueNotValid.localized()
    }
    
    var ibuText: String {
        if let ibuValue = ibu {
            return String(ibuValue)
        }
        return ApplicationStrings.valueNotValid.localized()
    }
    
    var image: String {
        if let imageUrl = imageUrl {
            return imageUrl
        }
        return ApplicationStrings.valueNotValid.localized()
    }
}
