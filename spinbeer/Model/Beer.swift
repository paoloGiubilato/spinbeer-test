//
//  Beer.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import Foundation

struct Beer: Decodable {
    let name: String?
    let description: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let first_brewed: String?
    let food_pairing: [String]?
    let brewers_tips: String?
}
