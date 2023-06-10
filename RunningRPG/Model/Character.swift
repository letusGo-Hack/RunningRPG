//
//  Character.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//

import AppIntents
import WidgetKit

struct Character: Hashable, Codable, Identifiable {
  static func == (lhs: Character, rhs: Character) -> Bool {
    return lhs.id == rhs.id
  }
  
  

  //    static var typeDisplayRepresentation: TypeDisplayRepresentation = "EmojiRanger"
  
  //    static let LeaderboardWidgetKind: String = "LeaderboardWidget"
  //    static let EmojiRangerWidgetKind: String = "EmojiRangerWidget"
  
  //    var displayRepresentation: DisplayRepresentation {
  //        DisplayRepresentation(title: "\(avatar) \(name)")
  //    }
  
  let name: String
  let avatar: String
  let damage: Double
  let equiment: Equiment
  let walkCount: Int

  var id: String {
    name
  }
}
