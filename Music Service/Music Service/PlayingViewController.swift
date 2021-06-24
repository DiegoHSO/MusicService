//
//  PlayingViewController.swift
//  Music Service
//
//  Created by Diego Henrique on 24/06/21.
//

import UIKit

class PlayingViewController: UIViewController {

    var music: Music?
    var collections: MusicService?
    var isFavorite: Bool = false
    var isPlaying: Bool = true
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    @IBOutlet weak var favoriteButtonLabel: UIButton!
    @IBOutlet weak var songProgress: UIProgressView!
    
    @IBOutlet weak var leftSongDuration: UILabel!
    @IBOutlet weak var rightSongDuration: UILabel!
    @IBAction func songBackward(_ sender: UIButton) {
    }
    @IBAction func songForward(_ sender: UIButton) {
    }

    @
    IBOutlet weak var playSongLabel: UIButton!
    @IBAction func playSong(_ sender: UIButton) {
        isPlaying.toggle()
        let imageName = isPlaying ? "play.circle.fill" : "pause.circle.fill"
        let favoriteImage = UIImage(systemName: imageName)
        playSongLabel.setImage(favoriteImage, for: .normal)
    }
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        guard let music = self.music else {
            return
        }
        isFavorite.toggle()
        collections?.toggleFavorite(music: music, isFavorite: isFavorite)
        let imageName = isFavorite ? "heart.fill" : "heart"
        let favoriteImage = UIImage(systemName: imageName)
        favoriteButtonLabel.setImage(favoriteImage, for: .normal)
        favoriteButtonLabel.tintColor = isFavorite ? .systemPink : .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let music = self.music, let collections = self.collections else {
            return
        }
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .default
        formatter.allowedUnits = [.minute, .second]
        
        albumCover.image = UIImage(named: music.id)
        leftSongDuration.text = "0:00"
        rightSongDuration.text = formatter.string(from: music.length)
        songArtist.text = music.artist
        songTitle.text = music.title
        let isFavorite = collections.favoriteMusics.contains(music)
        let imageName = isFavorite ? "heart.fill" : "heart"
        let favoriteImage = UIImage(systemName: imageName)
        favoriteButtonLabel.setImage(favoriteImage, for: .normal)
        favoriteButtonLabel.tintColor = isFavorite ? .systemPink : .black
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let music = self.music, let collections = self.collections else {
            return
        }
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .default
        formatter.allowedUnits = [.minute, .second]
        
        albumCover.image = UIImage(named: music.id)
        leftSongDuration.text = "0:00"
        rightSongDuration.text = formatter.string(from: music.length)
        songArtist.text = music.artist
        songTitle.text = music.title
        let isFavorite = collections.favoriteMusics.contains(music)
        let imageName = isFavorite ? "heart.fill" : "heart"
        let favoriteImage = UIImage(systemName: imageName)
        favoriteButtonLabel.setImage(favoriteImage, for: .normal)
        favoriteButtonLabel.tintColor = isFavorite ? .systemPink : .black
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
