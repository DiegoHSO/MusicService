//
//  Album_Playlist_Details_ViewController.swift
//  Music Service
//
//  Created by Guilherme Valent Antonini on 21/06/21.
//

import UIKit

class Album_Playlist_Details_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var collection: MusicCollection?
    
    @IBOutlet weak var albumSongsTableView: UITableView!
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumArtistLabel: UILabel!
    @IBOutlet weak var albumSongsNumberLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
    
    override func viewDidLoad() {
        
        albumTitleLabel.text = collection?.title
        albumArtistLabel.text = "Album by \(collection?.mainPerson ?? "")"
        albumSongsNumberLabel.text = "\(collection?.musics.count ?? 0) songs"
        
        let dateFormatter = DateFormatter()
        
        albumReleaseDateLabel.text = "Released \(dateFormatter.string(from: collection!.referenceDate))"
        
        
        
        super.viewDidLoad()
        
        do {
            self.collection = musicService?.loadLibrary() ?? []
        } catch {
            print(error)
        }
        albumSongsTableView.dataSource = self
        albumSongsTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "album_playlist_detail-item", for: indexPath) as! Album_Playlist_Details_TableViewCell
        
        let musicItem = collection.musics[indexPath.row]
        
        cell.songTitle.text = musicItem.title
        cell.albumArtist.text = "\(musicItem.artist)"
            
        
        cell.albumCover.image = UIImage(named: musicItem.id)
        
        // BOTAO AQUI
        
        return cell
    }

}
