//
//  FavoriteSongsViewController.swift
//  Music Service
//
//  Created by Diego Henrique on 23/06/21.
//

import UIKit

class FavoriteSongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteDelegate {
    func didTapButton(button: UIButton) {
        
        self.favoriteSongs = musicService?.favoriteMusics
        favoriteSongsTableView.reloadData()
    }
    
    var favoriteSongs: [Music]?
    var musicService: MusicService?
    
    @IBOutlet weak var favoriteSongsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            self.musicService = try MusicService()
            self.favoriteSongs = musicService?.favoriteMusics
        } catch {
            print(error)
        }
        favoriteSongsTableView.dataSource = self
        favoriteSongsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.favoriteSongs = musicService?.favoriteMusics
        
        favoriteSongsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicService?.favoriteMusics.count == 0 ? 1 : musicService?.favoriteMusics.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (!(musicService?.favoriteMusics.isEmpty)!) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "album_playlist_detail-item", for: indexPath) as! AlbumPlaylistDetailsTableViewCell
            
            let musicItem = favoriteSongs![indexPath.row]
            
            cell.songTitle.text = musicItem.title
            cell.albumArtist.text = "\(musicItem.artist)"
                
            cell.favoriteDelegate = self
            
            cell.albumCover.image = UIImage(named: musicItem.id)
            
            cell.collections = musicService
            
            cell.music = musicItem
            
            cell.isFavorite = true
            
            let imageName = "heart.fill"
            
            let favoriteImage = UIImage(systemName: imageName)
            
            cell.favoriteButton.setImage(favoriteImage, for: .normal)
            
            cell.favoriteButton.tintColor = .systemPink
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "no-favorites", for: indexPath) as! NoFavoriteSongsTableViewCell
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
