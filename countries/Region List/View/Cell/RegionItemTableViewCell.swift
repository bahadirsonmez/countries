//
//  RegionItemTableViewCell.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class RegionItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    var viewModel: RegionItemViewModel? {
        didSet {
            configureCell()
        }
    }
    
    private func configureCell() {
        titleLabel.text = viewModel?.title
    }
    
}
