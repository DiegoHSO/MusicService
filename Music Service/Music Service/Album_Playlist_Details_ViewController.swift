//
//  Album_Playlist_Details_ViewController.swift
//  Music Service
//
//  Created by Guilherme Valent Antonini on 21/06/21.
//

import UIKit

class Album_Playlist_Details_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var collection: MusicCollection?
        
    @IBOutlet weak var albumSongsTableView: UITableView!
    @IBOutlet var infoButton: UIBarButtonItem!
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumArtistLabel: UILabel!
    @IBOutlet weak var albumSongsNumberLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    @IBOutlet weak var albumCover: UIImageView!
    
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
        
        if collection?.type == .playlist {
            self.navigationItem.rightBarButtonItem = nil
        }
        
        
        albumSongsTableView.dataSource = self
        albumSongsTableView.delegate = self
        self.navigationItem.title = collection?.title
        albumArtistLabel.text = collection?.mainPerson
        albumCover.image = UIImage(named: collection?.id ?? "")
        
        let dateFormatter = DateFormatter()
        
        albumReleaseDateLabel.text = "Released \(dateFormatter.string(from: collection?.referenceDate ?? Date()))"
        albumSongsNumberLabel.text = "\(collection?.musics.count ?? 0) songs"
        albumTitleLabel.text = collection?.title
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection!.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "album_playlist_detail-item", for: indexPath) as! Album_Playlist_Details_TableViewCell
        
        let musicItem = collection!.musics[indexPath.row]
        
        cell.songTitle.text = musicItem.title
        cell.albumArtist.text = "\(musicItem.artist)"
            
        
        cell.albumCover.image = UIImage(named: musicItem.id)
        
        // BOTAO AQUI
        
        return cell
    }

}
