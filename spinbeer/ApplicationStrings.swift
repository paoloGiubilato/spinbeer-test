//
//  Strings.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 10/06/22.
//

import Foundation

protocol Localizable {
    var rawValue: String { get }
}

extension Localizable {
    var localizedValue: String {
        return self.rawValue
    }
    
    func localized() -> String {
        return NSLocalizedString(localizedValue, comment: localizedValue)
    }
}


enum ApplicationStrings: String, Localizable {
    case commonOR
    
    case beerListTitle
    case beerDetailsValueFirstBrew
    case beerDetailsValueBrewerTips
    case beerDetailsValuePairingInfo
    case beerValueABV
    case beerValueIBU
    
    case valueNotValid
}
