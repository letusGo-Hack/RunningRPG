//
//  ShopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI
import SwiftData
import WidgetKit
import ActivityKit

struct ShopView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    
    let character: Character = Character(name: "rpg", avatar: "human_small", damage: 1, equiment: .init(damage: 1, category: 1, name: "rpg"), walkCount: 0)
    
    var body: some View {
        NavigationView {
            Button("test") {
                connectLiveActivity(character: character)
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
    
    private func connectLiveActivity(character: Character) {
        
        do {
            let run = RunAttributes(character: character)
            
            let monster = Monster.generatMock()
            let initial = RunAttributes.ContentState(monster: monster[0])
            let contentState = RunningRPGDynamicIslandAttributes.ContentState(value: 1)
            
            let activity = try Activity.request(
                attributes: run,
                contentState: initial,
                pushType: nil
            )
            print(activity)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ShopView()
        .modelContainer(for: Item.self, inMemory: true)
}
