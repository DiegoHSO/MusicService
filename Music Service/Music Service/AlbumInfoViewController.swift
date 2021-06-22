//
//  AlbumInfoViewController.swift
//  Music Service
//
//  Created by Guilherme Valent Antonini on 22/06/21.
//

import UIKit

class AlbumInfoViewController: UIViewController {
    
    var collection: MusicCollection?

    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var albumDuration: UILabel!
    @IBOutlet weak var albumReleaseDate: UILabel!
    
    @IBOutlet weak var detailText: UILabel!
    
    @IBAction func dismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albumArtist.text = collection?.mainPerson
        albumCover.image = UIImage(named: collection?.id ?? "")
        
        let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
        
        albumReleaseDate.text = "Released \(dateFormatter.string(from: collection?.referenceDate ?? Date()))"
        
        var duration: TimeInterval = 0.0
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        
        formatter.allowedUnits = [.hour, .minute, .second]
        
        for music in collection!.musics {
            duration += music.length
        }
        
        albumDuration.text = "\(collection?.musics.count ?? 0) songs, \(formatter.string(from: duration)!)"
        
        albumTitle.text = collection?.title
        
        detailText.text = collection?.albumDescription
    }

}
