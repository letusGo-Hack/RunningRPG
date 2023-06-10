//
//  Monster.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//

import Foundation
import WidgetKit
import AppIntents

struct Monster: Hashable, Codable, Identifiable {
  let name: String
  let hp: Double
  let currentHp: Double
  let avatar: String

  var id: String {
    name
  }
}

extension Monster {
    static func generatMock() -> [Monster] {
        return [
            Monster(name: "칼든사람", hp: 100, currentHp: 100, avatar: "monster_swordshield_small")
        ]
        
        
    }
}
