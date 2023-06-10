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
        NavigationLink {
          Text("Hello")
        } label: {
          Image(systemName: "sun.min")
          Text("\(item.monster.name)")
        }

      }
    }

//    NavigationView {
//      List {
//        ForEach(listItems) { item in
//          NavigationLink {
//            Text("Item at \(item.monster., format: Date.FormatStyle(date: .numeric, time: .standard))")
//          } label: {
//            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//          }
//        }
//        .onDelete(perform: deleteItems)
//      }
//      .toolbar {
//        ToolbarItem(placement: .navigationBarTrailing) {
//          EditButton()
//        }
//        ToolbarItem {
//          Button(action: addItem) {
//            Label("Add Item", systemImage: "plus")
//          }
//        }
//      }
//      Text("Select an item")
//    }
  }

  private func addItem() {
//    withAnimation {
//      let newItem = Item(timestamp: Date())
//      modelContext.insert(newItem)
//    }
  }

  private func deleteItems(offsets: IndexSet) {
//    withAnimation {
//      for index in offsets {
//        modelContext.delete(items[index])
//      }
//    }
  }
}

#Preview {
  MonsterListView()
    .modelContainer(for: Item.self, inMemory: true)
}
