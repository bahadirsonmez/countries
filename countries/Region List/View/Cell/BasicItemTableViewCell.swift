//
//  BasicItemTableViewCell.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class BasicItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    var viewModel: BasicItemViewModel? {
        didSet {
            configureCell()
        }
    }
    
    private func configureCell() {
        titleLabel.text = viewModel?.title
    }
    
}
