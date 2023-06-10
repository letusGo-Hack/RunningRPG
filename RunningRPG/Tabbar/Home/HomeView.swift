//
//  HomeView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query private var monster: Monster
//    @Query private var character: [Monster]
    
    var body: some View {
        VStack {
            HomeTopView()
            HomeBottomView()
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    HomeView()
        .modelContainer(for: Item.self, inMemory: true)
}
