//
//  LibraryTableViewCell.swift
//  Music Service
//
//  Created by Diego Henrique on 21/06/21.
//

import UIKit

class AlbumPlaylistDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
