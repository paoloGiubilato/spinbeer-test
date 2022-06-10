//
//  ViewController.swift
//  spinbeer
//
//  Created by Paolo Giubilato on 09/06/22.
//

import UIKit

class BeerListViewController: BaseViewController<BeerListViewModel> {
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.dataLoaded = { [weak self] in
            self?.tableView.reloadData()
            UIView.animate(withDuration: 0.5, delay: 0) {
                self?.tableView.alpha = 1
            }
        }
    }
    
    override func buildUI() {
        self.view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        tableView.register(UINib(nibName: "BeerTableViewCell", bundle: nil), forCellReuseIdentifier: BeerTableViewCell.reuseIdentifier)
        
        title = ApplicationStrings.beerListTitle.localized()
        tableView.alpha = 0
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

extension BeerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.didSelectCell(at: indexPath.row)
    }
}

extension BeerListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reuseIdentifier, for: indexPath) as? BeerTableViewCell else { return UITableViewCell() }
        cell.bind(with: vm.cellInfo(at: indexPath.row))
        return cell
    }
}

extension BeerListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        vm.filterResults(with: searchText)
    }
}
