//
//  CountryDetailViewController.swift
//  countries
//
//  Created by Bahadır Kişisel on 30.05.2022.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var currenciesLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var neighboursTableView: UITableView!
    @IBOutlet weak var closeButton: UIButton!
    
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
        setup()
//        viewModel.getCountries()
    }
    
    private func setup() {
        configureTableView()
        bindViewModel()
//        title = viewModel.title
    }
    
    private func configureTableView() {
        neighboursTableView.delegate = self
        neighboursTableView.dataSource = self
        neighboursTableView.separatorStyle = .singleLine
        neighboursTableView.register(cell: BasicItemTableViewCell.self)
        neighboursTableView.reloadData()
    }
    
    private func bindViewModel() {
//        viewModel.reloadCompletion = { [weak self] in
//            self?.neighboursTableView.reloadData()
//        }
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CountryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CountryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BasicItemTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.regionItemViewModel(at: indexPath.row)
        return cell
    }
}

