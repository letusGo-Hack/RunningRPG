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
  var currentHp: Double
  let avatar: String
  let level: Int
  let isOpen: Bool

  var id: String {
    name
  }
}

enum MonsterType {
    case swordShield
    case pizza
    case gun
    case squirrel
    
    var urls: String {
        switch self {
        case .squirrel:
            return "monster_ squirrel"
        case .gun:
            return "monster_gun"
        case .pizza:
            return "monster_pizza"
        case .swordShield:
            return "monster_swordshield"
        }
    }
}

extension Monster {
    static func generatMock() -> [Monster] {
        return [
            Monster(name: "칼든사람", hp: 100, currentHp: 100, avatar: "monster_swordshield_small", level: 0, isOpen: true)
        ]
        
        
    }
}
