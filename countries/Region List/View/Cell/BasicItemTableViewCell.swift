//
//  BasicItemTableViewCell.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class BasicItemTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Variables
    
    var viewModel: BasicItemViewModel? {
        didSet {
            configureCell()
        }
    }
    
    // MARK: - Configuration
    
    private func configureCell() {
        titleLabel.text = viewModel?.title
    }
    
}
