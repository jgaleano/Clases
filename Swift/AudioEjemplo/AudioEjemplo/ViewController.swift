//
//  ViewController.swift
//  AudioEjemplo
//
//  Created by Julio Cesar Galeano on 10/10/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playClick(_ sender: Any) {
        do {
            if let fileURL = Bundle.main.path(forResource: "Cancion", ofType: "mp3") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }
    }
    
    @IBAction func pauseClick(_ sender: Any) {
        audioPlayer?.pause()
        audioPlayer?.stop()
    }
}

