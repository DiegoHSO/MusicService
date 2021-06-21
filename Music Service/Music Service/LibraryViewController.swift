//
//  LibraryViewController.swift
//  Music Service
//
//  Created by Diego Henrique on 18/06/21.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
