//
//  MonsterInformationView.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//

import SwiftUI

struct MonsterInformationView: View {

  let item: MonsterListItem

  var body: some View {
    VStack(alignment: .leading, spacing: 10, content: {
      HStack(content: {
        Text("\(item.monster.name)")
        Spacer()
        Text("Level - \(item.monster.level)")
      })
      HStack(alignment: .top, spacing: 5, content: {
        Text("\(item.monster.currentHp) / \(item.monster.hp)")
      })
    })
  }
}
