//
//  ShopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI
import SwiftData
import WidgetKit

struct ShopView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationView {
            Button("test") {
                let dynamicIslandWidgetAttributes = RunningRPGDynamicIslandAttributes
                  let contentState = RunningRPGDynamicIslandAttributes.ContentState(value: "")
                  
                  do {
                    let activity = try Activity<RunningRPGDynamicIslandAttributes>.request(
                      attributes: dynamicIslandWidgetAttributes,
                      contentState: contentState
                    )
                    print(activity)
                  } catch {
                    print(error)
                  }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ShopView()
        .modelContainer(for: Item.self, inMemory: true)
}
