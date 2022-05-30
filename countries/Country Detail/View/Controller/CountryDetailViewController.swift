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
    @IBOutlet weak var mapButton: UIButton!
    
    private let viewModel: CountryDetailViewModel
        
    init(viewModel: CountryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getNeighbours()
    }
    
    private func setup() {
        configureTableView()
        configure()
        bindViewModel()
    }
    
    private func configureTableView() {
        neighboursTableView.delegate = self
        neighboursTableView.dataSource = self
        neighboursTableView.separatorStyle = .singleLine
        neighboursTableView.register(cell: BasicItemTableViewCell.self)
    }
    
    private func configure() {
        closeButton.backgroundColor = .label.withAlphaComponent(0.5)
        closeButton.layer.cornerRadius = 4
        mapButton.backgroundColor = .label.withAlphaComponent(0.5)
        mapButton.layer.cornerRadius = 4
        flagImageView.imageFromServerURL(viewModel.flagUrl, placeHolder: UIImage(systemName: "flag.fill"))
        currenciesLabel.text = viewModel.currencies
        languagesLabel.text = viewModel.languages
        neighboursTableView.reloadData()
    }
    
    private func bindViewModel() {
        viewModel.countryRetrieved = { [weak self] country in
            let viewModel = CountryDetailViewModel(with: country)
            let viewController = CountryDetailViewController(viewModel: viewModel)
            self?.present(viewController, animated: true, completion: nil)
        }
        viewModel.reloadCompletion = { [weak self] in
            self?.neighboursTableView.reloadData()
        }
    }
    
    @IBAction func mapButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CountryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getCountry(at: indexPath.row)
    }
}

extension CountryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BasicItemTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.basicItem(at: indexPath.row)
        return cell
    }
}

