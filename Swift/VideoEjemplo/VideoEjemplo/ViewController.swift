//
//  ViewController.swift
//  VideoEjemplo
//
//  Created by Julio Cesar Galeano on 10/10/19.
//  Copyright © 2019 Julio Cesar Galeano. All rights reserved.
//

import UIKit
import AVKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func controladorVideoClick(_ sender: Any) {
        guard let url: URL = URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4") else {return}
        let player = AVPlayer(url: url)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
    }
    
}

