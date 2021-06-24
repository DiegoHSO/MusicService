//
//  AboutArtistTableViewCell.swift
//  Music Service
//
//  Created by Diego Henrique on 24/06/21.
//

import UIKit

class AboutArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var aboutArtistTitleLabel: UILabel!
    @IBOutlet weak var aboutArtistDescriptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.setCustomSpacing(8, after: aboutArtistTitleLabel)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
