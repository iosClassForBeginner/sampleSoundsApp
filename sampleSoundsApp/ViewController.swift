//
//  ViewController.swift
//  sampleSoundsApp
//
//  Created by Muneharu Onoue on 2017/07/08.
//  Copyright © 2017年 Muneharu Onoue. All rights reserved.
//

import UIKit
import AVFoundation // オーディオプレイヤー使うとき、インポートしましょう

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        initAudioPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // audioPlayer初期化
    func initAudioPlayer()
    {
        let filePath = Bundle.main.path(forResource: "sound", ofType: "mp3")
        let audioPath = URL(fileURLWithPath: filePath!)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer?.prepareToPlay()
    }

    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.play()
    }

    @IBAction func stop(_ sender: UIButton) {
        audioPlayer?.stop()
    }
}

