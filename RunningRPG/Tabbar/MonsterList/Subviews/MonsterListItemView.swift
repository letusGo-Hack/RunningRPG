//
//  MonsterListItemView.swift
//  RunningRPG
//
//  Created by 김호세 on 6/10/23.
//


import SwiftUI

struct MonsterListItemView: View {

  let item: MonsterListItem

  var body: some View {

    HStack(alignment: .center, spacing: 10, content: {
      Image(item.monster.avatar).resizable().frame(width: 50, height: 50)
      MonsterInformationView(item: item)
    })
  }
}
