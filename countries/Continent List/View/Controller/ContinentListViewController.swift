//
//  ContinentListViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class ContinentListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    private let viewModel: ContinentListViewModel
        
    init(viewModel: ContinentListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Continents"
        setup()
    }
    
    private func setup() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(cell: ContinentItemTableViewCell.self)
        tableView.reloadData()
    }

}

extension ContinentListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let continentName = viewModel.continentItemViewModel(at: indexPath.row).continent.rawValue
        let viewModel = CountryListViewModel(with: continentName)
        let viewController = CountryListViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ContinentListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: ContinentItemTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.continentItemViewModel(at: indexPath.row)
        return cell
    }
}
