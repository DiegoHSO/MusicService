//
//  LibraryTableViewCell.swift
//  Music Service
//
//  Created by Diego Henrique on 21/06/21.
//

import UIKit

protocol FavoriteDelegate: AnyObject {
    func didTapButton(button: UIButton)
}


class AlbumPlaylistDetailsTableViewCell: UITableViewCell {
    
    var collections: MusicService?
    var music: Music?
    var isFavorite: Bool = false
    
    weak var favoriteDelegate: FavoriteDelegate?
    
    
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        isFavorite.toggle()
        collections?.toggleFavorite(music: music!, isFavorite: isFavorite)
        
        favoriteDelegate?.didTapButton(button: sender)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
