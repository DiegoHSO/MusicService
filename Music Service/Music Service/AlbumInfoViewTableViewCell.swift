//
//  AlbumInfoViewTableViewCell.swift
//  Music Service
//
//  Created by Guilherme Valent Antonini on 23/06/21.
//

import UIKit

class AlbumInfoViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var albumDuration: UILabel!
    @IBOutlet weak var albumReleaseDate: UILabel!
    @IBOutlet weak var detailText: UILabel!

    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stackView.setCustomSpacing(0, after: albumDuration)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
