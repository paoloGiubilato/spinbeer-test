//
//  BeerListViewModel.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import Foundation

class BeerListViewModel: BaseViewModel<ApplicationCoordinator> {
    
    private var beersProvider: BeersManager = BeersManager(networkProvider: NetworkManager())

    var beersList: [Beer] = []
    var filteredBeersList: [Beer] = []
    var dataLoaded: (() -> Void)?
    
    var numberOfRows: Int {
        return filteredBeersList.count
    }
    
    override func fetchData() {
        beersProvider.requestBeersList { [weak self] beerListResult in
            switch beerListResult {
            case .success(let beerList):
                self?.beersList = beerList
                self?.filteredBeersList = beerList
                self?.dataLoaded?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func cellInfo(at index: Int) -> BeerCellViewModel {
        guard index < filteredBeersList.count else { return BeerCellViewModel(name: "", description: "", abv: nil, ibu: nil, imageUrl: nil)}
        let beer = filteredBeersList[index]
        let beerCellVM = BeerCellViewModel(name: beer.name ?? "", description: beer.description ?? "", abv: beer.abv, ibu: beer.ibu, imageUrl: beer.image_url)
        return beerCellVM
    }
    
    func filterResults(with text: String) {
        var filteredResult: [Beer] = []
        if text.isEmpty {
            filteredResult = beersList
        } else {
            filteredResult = self.beersList.filter { ($0.name?.lowercased().contains(text.lowercased()) ?? false) || ($0.description?.lowercased().contains(text.lowercased()) ?? false) }
        }
        
        self.filteredBeersList = filteredResult
        self.dataLoaded?()
    }
    
    func didSelectCell(at index: Int) {
        guard index < filteredBeersList.count else { return }
        let selectedBeer = filteredBeersList[index]
        coordinator?.goToBeerDetail(selectedBeer: selectedBeer)
    }
}
