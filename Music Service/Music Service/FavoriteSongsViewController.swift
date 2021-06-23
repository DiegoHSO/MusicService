//
//  FavoriteSongsViewController.swift
//  Music Service
//
//  Created by Diego Henrique on 23/06/21.
//

import UIKit

class FavoriteSongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteDelegate {
    func didTapButton(button: UIButton) {
        
        guard let musicCollection = musicCollection
        else {return}
        
        self.musicCollection = musicService?.getCollection(id: musicCollection.id)
        
        favoriteSongsTableView.reloadData()
    }
    
    
    var musicCollection: MusicCollection?
    var musicService: MusicService?
    
    @IBOutlet weak var favoriteSongsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteSongsTableView.dataSource = self
        favoriteSongsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let musicCollection = musicCollection
        else {return}
        
        self.musicCollection = musicService?.getCollection(id: musicCollection.id)
        
        favoriteSongsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicService?.favoriteMusics.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thereIsFavoriteSongs = (musicService?.favoriteMusics.isEmpty)!
        
        if (thereIsFavoriteSongs) {
            let cell = tableView.dequeueReusableCell(withIdentifier: thereIsFavoriteSongs ? "album_playlist_detail-item" : "no-favorites", for: indexPath) as! AlbumPlaylistDetailsTableViewCell
            
            let musicItem = musicCollection!.musics[indexPath.row]
            
            cell.songTitle.text = musicItem.title
            cell.albumArtist.text = "\(musicItem.artist)"
                
            cell.favoriteDelegate = self
            
            cell.albumCover.image = UIImage(named: musicItem.id)
            
            cell.collections = musicService
            
            cell.music = musicItem
            
            let isFavorite = musicService?.favoriteMusics.contains(musicItem) ?? false
            
            let imageName = isFavorite ? "heart.fill" : "heart"
            
            let favoriteImage = UIImage(systemName: imageName)
            
            cell.favoriteButton.setImage(favoriteImage, for: .normal)
            
            cell.favoriteButton.tintColor = isFavorite ? .red : .black
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: thereIsFavoriteSongs ? "album_playlist_detail-item" : "no-favorites", for: indexPath) as! NoFavoriteSongsTableViewCell
            
            return cell
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
