//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {
    
    @IBOutlet private var songName: UILabel!
    
    var player = AVAudioPlayer()
    
    var recordNum: Int = 0 {
        didSet {
            do {
                let isPlaying = player.isPlaying
                player.stop()
                
                player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: songs[recordNum].fileName, ofType: "mp3")!))
                
                songName.text = "\(songs[recordNum].songName) - \(songs[recordNum].executor)"
                player.prepareToPlay()
                
                if isPlaying { player.play() }
            }
            catch {
                print(error)
                songName.text = error.localizedDescription
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recordNum = 0
    }
    
    @IBAction func nextSong(_ sender: Any) {
        if recordNum < (songs.endIndex - 1) {
            recordNum += 1
        }
    }
    
    @IBAction func previousSong(_ sender: Any) {
        if songs.startIndex < recordNum {
            recordNum -= 1
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        if !player.isPlaying {
            player.play()
        } else {
            print("Already played!")
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        if player.isPlaying {
            player.pause()
        }
        else {
            print("Already paused!")
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        if player.isPlaying {
            player.stop()
            player.currentTime = 0
        }
        else {
            print("Already stopped!")
        }
    }
}
