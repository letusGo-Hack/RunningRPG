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
      MonsterListItem(
        monster: Monster.init(
          name: "총든 몬스터",
          hp: 10.0,
          currentHp: 10.0,
          avatar: MonsterType.gun.urls,
          level: 0, isOpen: true
        )
      ),
      MonsterListItem(
        monster: Monster.init(
          name: "다람쥐 몬스터",
          hp: 20.0,
          currentHp: 20.0,
          avatar: MonsterType.squirrel.urls,
          level: 1,
          isOpen: true
        )
      ),
      MonsterListItem(
        monster: Monster.init(
          name: "피자 몬스터",
          hp: 30.0,
          currentHp: 30.0,
          avatar: MonsterType.pizza.urls,
          level: 2,
          isOpen: true
        )
      ),
      MonsterListItem(
        monster: Monster.init(
          name: "칼이랑 방패든 몬스터",
          hp: 40.0,
          currentHp: 40.0,
          avatar: MonsterType.swordShield.urls,
          level: 3,
          isOpen: true
        )
      ),
    ]
  }
}
