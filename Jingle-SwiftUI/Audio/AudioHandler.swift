//
//  AudioHandler.swift
//  Jingle-SwiftUI
//
//  Created by Charlie Williams on 20/12/2021.
//

import AudioKit
import Foundation
import AVFAudio

class AudioHandler {
    
    let mixer = Mixer()
    let engine = AudioEngine()
    
    static let shared = AudioHandler()
    
    private init() {
        
        engine.output = mixer
        
        start()
    }
    
    private func checkActive() {
        
        do {
            Settings.bufferLength = .short
            try AVAudioSession.sharedInstance().setPreferredIOBufferDuration(Settings.bufferLength.duration)
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord,
                                                            options: [.defaultToSpeaker, .mixWithOthers, .allowBluetoothA2DP])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let err {
            print(err)
        }
    }
    
    func start() {
        
        checkActive()
        
        do {
            try engine.start()
        } catch {
            print(error)
        }
    }
    
    func didBackground() {
        
        if !SettingsStore().keepPlayingAudioInBackground {
            stop()
        }
    }
    
    func stop() {
        
        try? AVAudioSession.sharedInstance().setActive(false)
    }
}
