//
//  RunAttributes.swift
//  RunningRPG
//
//  Created by min on 2023/06/10.
//

import Foundation
import ActivityKit

struct RunAttributes: ActivityAttributes {
    struct ContentState: Codable & Hashable {
        let monster: Monster
    }
    
    let character: Character
}
