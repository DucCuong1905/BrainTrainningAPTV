//
//  AudioService.swift
//  applTv
//
//  Created by dev-sonpipi on 12/11/2020.
//  Copyright © 2020 dev-sonpipi. All rights reserved.
//

import Foundation
import AVFoundation

class StaticAudio: NSObject {
    static var sharaAudio = StaticAudio()
    var check: Bool?
    var player: AVAudioPlayer?

    func playAudio() {
        guard let url = Bundle.main.url(forResource: "Ho", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line: 
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            guard let player = player else { return }
            player.play()
            check = true
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func stopAudio(){
        do {
            guard let player = player else { return }
            player.stop()
            check = false
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}
