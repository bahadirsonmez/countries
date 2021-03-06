//
//  SearchViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class SearchViewController: BaseViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Initialization
    
    private let viewModel: SearchViewModel
        
    init(viewModel: SearchViewModel) {
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
    }
    
    // MARK: - Configuration
    
    private func setup() {
        configureTableView()
        configureSearchBar()
        bindViewModel()
        title = viewModel.title
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cell: CountryItemTableViewCell.self)
    }
    
    private func configureSearchBar() {
        searchBar.delegate = self
    }
    
    private func bindViewModel() {
        viewModel.reloadCompletion = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
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

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: CountryItemTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.countryItem(at: indexPath.row)
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(#selector(updateWithDebouncer(text:)), with: searchText, afterDelay: 0.4)
    }
    
    @objc func updateWithDebouncer(text: String) {
        viewModel.searchText = text.count > 1 ? text : nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
