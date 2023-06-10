//
//  MonsterListItem.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//

import Foundation

internal final class MonsterListItem: Identifiable {
  var monster: Monster

  internal init(monster: Monster) {
    self.monster = monster
  }
}


extension MonsterListItem {
  static func generateMonsters() -> [MonsterListItem] {
    return [
      MonsterListItem(monster: Monster.init(name: "Test1", hp: 10.0, currentHp: 10.0, avatar: "URL1", level: 0, isOpen: true)),
      MonsterListItem(monster: Monster.init(name: "Test2", hp: 20.0, currentHp: 20.0, avatar: "URL1", level: 1, isOpen: true)),
      MonsterListItem(monster: Monster.init(name: "Test3", hp: 30.0, currentHp: 30.0, avatar: "URL1", level: 2, isOpen: true)),
      MonsterListItem(monster: Monster.init(name: "Test4", hp: 40.0, currentHp: 40.0, avatar: "URL1", level: 3, isOpen: true)),
      MonsterListItem(monster: Monster.init(name: "Test5", hp: 50.0, currentHp: 50.0, avatar: "URL1", level: 4, isOpen: true)),
      MonsterListItem(monster: Monster.init(name: "Test6", hp: 60.0, currentHp: 60.0, avatar: "URL1", level: 5, isOpen: true))
    ]
  }
}
