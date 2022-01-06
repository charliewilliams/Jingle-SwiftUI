//
//  Sounds.swift
//  Jingle-SwiftUI
//
//  Created by Charlie Williams on 20/12/2021.
//

import Foundation
import SwiftUI

enum Sound: String, Identifiable, CaseIterable {
    
    /// wtf
    var id: ObjectIdentifier { ObjectIdentifier(NSString(string: rawValue)) }
    
    var name: String { rawValue.capitalized }
    
    case jingle
    case iceCubes
    case spaceIceCubes
    
    /*
     
     typedef enum Instrument {
     JingleBells,
     Maracas,
     Tambourine,
     Shaker,
     SpaceWater1,
     SpaceWater2,
     Guiro,
     Snare,
     RainStick
     } Instrument;
     
     case Shaker: {
     return [CWInstrument instrumentWithName:@"Egg Shaker" image:[self imageNamed:@"Egg_Shaker"] index:Shaker];
     }
     break;
     
     case JingleBells: {
     return [CWInstrument instrumentWithName:@"Sleigh Bells" image:[self imageNamed:@"Sleigh_Bells"] index:JingleBells];
     }
     break;
     
     case Snare: {
     return [CWInstrument instrumentWithName:@"Snare Drum" image:[self imageNamed:@"Snare_Drum"] index:Snare];
     }
     break;
     
     case Tambourine: {
     return [CWInstrument instrumentWithName:@"Tambourine" image:[self imageNamed:@"Tambourine"] index:Tambourine];
     }
     break;
     
     case RainStick: {
     return [CWInstrument instrumentWithName:@"Rain Stick" image:[self imageNamed:@"Rain_Stick"] index:RainStick];
     }
     break;
     
     case Maracas: {
     return [CWInstrument instrumentWithName:@"Maracas" image:[self imageNamed:@"Maracas"] index:Maracas];
     }
     break;
     
     case Guiro: {
     return [CWInstrument instrumentWithName:@"Guiro" image:[self imageNamed:@"Guiro"] index:Guiro];
     }
     break;
     
     case SpaceWater1: {
     return [CWInstrument instrumentWithName:@"Space Water" image:[self imageNamed:@"Space_Water"] index:SpaceWater1];
     }
     break;
     
     case SpaceWater2: {
     return [CWInstrument instrumentWithName:@"Space Icecubes" image:[self imageNamed:@"Space_Water2"] index:SpaceWater2];
     }
     break;
     */
    
    var image: Image {
        
        switch self {
            
        case .jingle:
            return Image("Sleigh_Bells", bundle: nil)
        case .iceCubes:
            return Image("Space_Water", bundle: nil)
        case .spaceIceCubes:
            return Image("Space_Water2", bundle: nil)
        }
    }
}
