//
//  BeersManager.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import Foundation

protocol BeersProvider {
  func requestBeersList(completion: @escaping (Result<[Beer], Error>) -> Void)
}

class BeersManager: BeersProvider {
    let networkProvider: NetworkProvider
    
    init(networkProvider: NetworkProvider) {
      self.networkProvider = networkProvider
    }
    
    func requestBeersList(completion: @escaping (Result<[Beer], Error>) -> Void) {
      let beersRequest = BeersListRequest()
      networkProvider.request(request: beersRequest) { result in
        switch result {
        case .success(let beerList):
          completion(.success(beerList))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    }
    
}

struct BeersListRequest: Requestable {
    typealias Response = [Beer]
    
    var url: String = "https://api.punkapi.com/v2/beers"
    var method: HTTPMethod { .get }
    
}
