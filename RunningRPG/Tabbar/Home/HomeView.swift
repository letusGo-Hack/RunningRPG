//
//  HomeView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    private var monster: MonsterListItem = MonsterListItem.generateMonsters().first!
    
    var body: some View {
        VStack {
            
            HomeTopView()
                .frame(minHeight: 0, maxHeight: 262)
            
            HomeBottomView()
            
        }
    }
    
    
}

#Preview {
    HomeView()
        .modelContainer(for: Item.self, inMemory: true)
}
