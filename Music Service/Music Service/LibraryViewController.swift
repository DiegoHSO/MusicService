//
//  LibraryViewController.swift
//  Music Service
//
//  Created by Diego Henrique on 18/06/21.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var selectedIndexPath: IndexPath?

    // cell ID: library-detail
    
    private var musicService: MusicService?
    private var collections: [MusicCollection] = []
    
    @IBOutlet weak var libraryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        do {
            self.musicService = try MusicService()
            self.collections = musicService?.loadLibrary() ?? []
        } catch {
            print(error)
        }
        libraryTableView.dataSource = self
        libraryTableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "library-detail", for: indexPath) as! LibraryTableViewCell
        
        let musicItem = collections[indexPath.row]
        
        cell.songLabel.text = musicItem.title
        cell.songDetailLabel.text = musicItem.type == .album ?
            "Album · \(musicItem.mainPerson)" :
            "Playlist · \(musicItem.mainPerson)"
        
        cell.coverImage.image = UIImage(named: musicItem.id)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextViewController = segue.destination as? AlbumPlaylistDetailsViewController
        
        let index = sender as? Int
        
        let musicitem = collections[index ?? 0]
        
        nextViewController?.musicCollection = musicitem

        nextViewController?.musicService = musicService
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "navigateAlbumPlaylistDetail", sender: indexPath.row)
    }

}
