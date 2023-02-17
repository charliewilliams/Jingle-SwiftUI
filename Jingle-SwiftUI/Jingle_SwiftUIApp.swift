//
//  Jingle_SwiftUIApp.swift
//  Jingle-SwiftUI
//
//  Created by Charlie Williams on 19/12/2021.
//

import SwiftUI
import AVFoundation
import AudioKit

@main
struct Jingle_SwiftUIApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    let audio = AudioHandler.shared
    let motion = Motion.shared
    
    init() {
        
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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
                
            case .background:
                audio.didBackground()
                
            case .inactive:
//                audio.stop()
//                motion.stop()
                break
                
            case .active:
                audio.start()
                motion.start()
                
            @unknown default:
                fatalError("New thing here")
            }
        }
    }
}
