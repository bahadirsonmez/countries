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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
    }
}
