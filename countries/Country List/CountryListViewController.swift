//
//  CountryListViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 28.05.2022.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel: CountryListViewModel
        
    init(viewModel: CountryListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getCountries()
    }
    
    private func setup() {
        configureTableView()
        bindViewModel()
        title = viewModel.title
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.reloadData()
    }
    
    private func bindViewModel() {
        viewModel.reloadCompletion = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension CountryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CountryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = viewModel.countryItem(at: indexPath.row)?.title
        return cell
    }
}

