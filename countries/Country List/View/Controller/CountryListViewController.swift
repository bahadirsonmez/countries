//
//  CountryListViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import UIKit

class CountryListViewController: BaseViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initialization
    
    private let viewModel: CountryListViewModel
        
    init(viewModel: CountryListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getCountries()
    }
    
    // MARK: - Configuration
    
    private func setup() {
        configureTableView()
        bindViewModel()
        title = viewModel.title
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.register(cell: CountryItemTableViewCell.self)
    }
    
    private func bindViewModel() {
        viewModel.reloadCompletion = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate

extension CountryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = CountryDetailViewModel(with: viewModel.country(at: indexPath.row))
        let viewController = CountryDetailViewController(viewModel: viewModel)
        present(viewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CountryItemTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        CountryItemTableViewCell.cellHeight
    }
}

// MARK: - UITableViewDataSource

extension CountryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: CountryItemTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.countryItem(at: indexPath.row)
        return cell
    }
}

