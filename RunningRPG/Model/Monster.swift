//
//  Monster.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//

import Foundation

struct Monster: Hashable, Codable, Identifiable {
  let name: String
  let hp: Double
  let currentHp: Double
  let avatar: String

  var id: String {
    name
  }
}
