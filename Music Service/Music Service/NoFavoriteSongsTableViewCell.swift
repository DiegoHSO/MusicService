//
//  NoFavoriteSongsTableViewCell.swift
//  Music Service
//
//  Created by Diego Henrique on 23/06/21.
//

import UIKit

class NoFavoriteSongsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var noFavoritesImage: UIImageView!
    @IBOutlet weak var noFavoritesTitleLabel: UILabel!
    @IBOutlet weak var noFavoritesDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
