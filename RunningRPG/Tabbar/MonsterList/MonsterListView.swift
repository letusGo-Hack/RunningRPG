//
//  MonsterListView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI
import SwiftData

struct MonsterListView: View {
//  @Environment(\.modelContext) private var modelContext
//  @Query private var items: [Item]

  private var listItems: [MonsterListItem] = MonsterListItem.generateMonsters()

  var body: some View {

    List {
      ForEach(listItems) { item in
        MonsterListItemView(item: item)
      }
    }
    .listRowSpacing(20)
  }

  private func addItem() {}

  private func deleteItems(offsets: IndexSet) { }
}

#Preview {
  MonsterListView()
    .modelContainer(for: Item.self, inMemory: true)
}
