//
//  ApplicationCoordinator.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    func start()
    func goToBeerDetail(selectedBeer: Beer)
}

class ApplicationCoordinator: NSObject, CoordinatorProtocol {
    
    let window: UIWindow
    var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        super.init()
    }
    
    func start() {
        window.makeKeyAndVisible()
        window.rootViewController = self.navigationController
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        let vm = BeerListViewModel(with: self)
        let vc = BeerListViewController(viewModel: vm)
        navigationController?.viewControllers = [vc]
    }
    
    func goToBeerDetail(selectedBeer: Beer) {
        let vm = BeerDetailViewModel(coordinator: self, selectedBeer: selectedBeer)
        let vc = BeerDetailViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }

}
