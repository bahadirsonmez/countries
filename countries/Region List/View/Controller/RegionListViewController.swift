//
//  RegionListViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class RegionListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
        
    private let viewModel: RegionListViewModel
        
    init(viewModel: RegionListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Regions"
        setup()
    }
    
    private func setup() {
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(cell: BasicItemTableViewCell.self)
        tableView.reloadData()
    }

}

extension RegionListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let region = viewModel.regionItemViewModel(at: indexPath.row).region
        let viewModel = CountryListViewModel(with: region)
        let viewController = CountryListViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension RegionListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BasicItemTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.regionItemViewModel(at: indexPath.row)
        return cell
    }
}
