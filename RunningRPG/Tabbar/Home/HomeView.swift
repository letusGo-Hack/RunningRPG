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
//            Rectangle()
//                .fill(Color.clear)
            
            HomeTopView()
                .frame(minHeight: 0, maxHeight: 262)
            
//            Rectangle()
//                .fill(Color.clear)
            
            HomeBottomView()
//                .frame(minHeight: 0, maxHeight: .infinity)
            
//            Rectangle()
//                .fill(Color.clear)
        }
        .background(Color.white)
//        .ignoresSafeArea()
    }
    
    
}

#Preview {
    HomeView()
        .modelContainer(for: Item.self, inMemory: true)
}
