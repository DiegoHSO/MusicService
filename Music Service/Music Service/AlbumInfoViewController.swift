//
//  AlbumInfoViewController.swift
//  Music Service
//
//  Created by Guilherme Valent Antonini on 22/06/21.
//

import UIKit

class AlbumInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //    private var musicService: MusicService?
    var musicCollection: MusicCollection?
    
    @IBOutlet weak var albumInfoTableView: UITableView!
    
    @IBAction func dismissAction(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumInfoTableView.rowHeight = UITableView.automaticDimension
        albumInfoTableView.estimatedRowHeight = 700
        
        albumInfoTableView.dataSource = self
        albumInfoTableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "about", for: indexPath) as! AlbumInfoViewTableViewCell
            
            cell.albumCover.image = UIImage(named: musicCollection?.id ?? "")
            
            cell.albumTitle.text = musicCollection?.title ?? ""
            
            cell.albumArtist.text = "Album by \(musicCollection?.mainPerson ?? "")"
            
            var duration: TimeInterval = 0.0
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .abbreviated
            formatter.zeroFormattingBehavior = .dropAll
            formatter.allowedUnits = [.hour, .minute, .second]
            
            for music in musicCollection!.musics {
                duration += music.length
            }
            
            cell.albumDuration.text = "\(musicCollection?.musics.count ?? 0) songs, \(formatter.string(from: duration) ?? "")"
            
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            cell.albumReleaseDate.text = "Released \(dateFormatter.string(from: musicCollection?.referenceDate ?? Date()))"
            
            cell.detailText.text = musicCollection?.albumDescription
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "aboutArtist", for: indexPath) as! AboutArtistTableViewCell
            cell.aboutArtistTitleLabel.text = "About \(musicCollection?.mainPerson ?? "")"
            cell.aboutArtistDescriptionLabel.text =
                musicCollection?.albumArtistDescription
            return cell
        }
    }
    
    
    var collection: MusicCollection?
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}
