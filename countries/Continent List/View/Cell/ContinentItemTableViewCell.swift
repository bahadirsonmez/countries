//
//  ContinentItemTableViewCell.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class ContinentItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    var viewModel: ContinentItemViewModel? {
        didSet {
            configureCell()
        }
    }
    
    private func configureCell() {
        titleLabel.text = viewModel?.title
    }
    
}
