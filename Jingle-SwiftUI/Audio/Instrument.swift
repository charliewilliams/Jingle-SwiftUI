//
//  Instrument.swift
//  Jingle-SwiftUI
//
//  Created by Charlie Williams on 05/01/2022.
//

import AudioKit
import STKAudioKit
import SwiftUI

enum InstrumentName: String, CaseIterable {
    case jingle = "Sleigh Bells"
    case maracas
    case tambourine
    case shaker
    case spaceWater = "Space Water"
    case spaceIce = "Space Ice Cubes"
}

struct Instrument: Identifiable {
    
    var id: ObjectIdentifier { ObjectIdentifier(name as NSString) }
    
    let name: String
    let index: Int
    let image: Image
    let inst: STKAudioKit.STKBase
    
    init(name: InstrumentName) {
        
        self.name = name.rawValue.capitalized
        self.index = InstrumentName.allCases.firstIndex(of: name)!
        
        switch name {
        case .jingle:
            image = Image("Sleigh_Bells")
            inst = STKAudioKit.Shaker()
            
        case .maracas:
            image = Image("Maracas")
            inst = STKAudioKit.Shaker()
            
        case .tambourine:
            image = Image("Tambourine")
            inst = STKAudioKit.Shaker()
            
        case .shaker:
            image = Image("Egg_Shaker")
            inst = STKAudioKit.Shaker()
            
        case .spaceWater:
            image = Image("Space_Water")
            inst = STKAudioKit.Shaker()
            
        case .spaceIce:
            image = Image("Space_Water2")
            inst = STKAudioKit.Shaker()
            
        }
    }
    
}
