//
//  CountryItemTableViewCell.swift
//  countries
//
//  Created by Bahadır Kişisel on 29.05.2022.
//

import UIKit

class CountryItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nativeTitleLabel: UILabel!
    
    var viewModel: CountryItemViewModel? {
        didSet {
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    private func configureCell() {
        guard let viewModel = viewModel else {
            return
        }
        titleLabel.text = viewModel.title
        nativeTitleLabel.text = viewModel.nativeTitles
        flagImageView.imageFromServerURL(viewModel.flagUrl, placeHolder: UIImage(systemName: "flag.fill"))
    }

}
