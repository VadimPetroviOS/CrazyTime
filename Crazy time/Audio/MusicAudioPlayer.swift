//
//  MusicAudioPlayer.swift
//  Crazy time
//
//  Created by Вадим on 16.05.2023.
//

import AVFoundation

class MusicAudioPlayer {
    static let shared = MusicAudioPlayer()
    
    var currentVolume: Float = 1.0 {
            didSet {
                audioPlayer?.volume = currentVolume
            }
        }

    private var audioPlayer: AVAudioPlayer?

    private init() {
        guard let audioURL = Bundle.main.url(forResource: "audio", withExtension: "mp3") else { return }
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.prepareToPlay()
    }

    
    func play() {
        audioPlayer?.play()
    }

    func pause() {
        audioPlayer?.pause()
    }
}

