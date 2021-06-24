//
//  Album_Playlist_Details_ViewController.swift
//  Music Service
//
//  Created by Guilherme Valent Antonini on 21/06/21.
//

import UIKit

class AlbumPlaylistDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FavoriteDelegate {
    
    func didTapButton(button: UIButton) {
        
        guard let musicCollection = musicCollection
        else {return}
        
        self.musicCollection = musicService?.getCollection(id: musicCollection.id)
        
        albumSongsTableView.reloadData()
    }
    
    
    var musicCollection: MusicCollection?
    var musicService: MusicService?
        
    @IBOutlet weak var albumSongsTableView: UITableView!
    @IBOutlet var infoButton: UIBarButtonItem!
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumArtistLabel: UILabel!
    @IBOutlet weak var albumSongsNumberLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
    @IBAction func infoButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "navigateAlbumInfo", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let musicCollection = musicCollection
        else {return}
        
        self.musicCollection = musicService?.getCollection(id: musicCollection.id)
        
        albumSongsTableView.reloadData()
    }
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        if musicCollection?.type == .playlist {
            self.navigationItem.rightBarButtonItem = nil
        }
        
        
        albumSongsTableView.dataSource = self
        albumSongsTableView.delegate = self
        self.navigationItem.title = musicCollection?.title
        albumArtistLabel.text = musicCollection?.mainPerson
        albumCover.image = UIImage(named: musicCollection?.id ?? "")
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
        
        albumReleaseDateLabel.text = "Released \(dateFormatter.string(from: musicCollection?.referenceDate ?? Date()))"
        
        albumSongsNumberLabel.text = "\(musicCollection?.musics.count ?? 0) songs"
        albumTitleLabel.text = musicCollection?.title
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicCollection!.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "album_playlist_detail-item", for: indexPath) as! AlbumPlaylistDetailsTableViewCell
        
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
        
        cell.favoriteButton.tintColor = isFavorite ? .systemPink : .black
        
        // BOTAO AQUI
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let musicItem = musicCollection!.musics[indexPath.row]
            performSegue(withIdentifier: "navigatePlaying", sender: musicItem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as? UINavigationController
        
        let albumInfoViewController = destination?.viewControllers.first as? AlbumInfoViewController
        
        albumInfoViewController?.musicCollection = musicCollection

        let playingViewController = destination?.viewControllers.first as? PlayingViewController
        
        guard let musicItem = sender as? Music else {
            return
        }
        
        playingViewController?.music = musicItem
        playingViewController?.isFavorite = musicService?.favoriteMusics.contains(musicItem) ?? false
    }
    


}
