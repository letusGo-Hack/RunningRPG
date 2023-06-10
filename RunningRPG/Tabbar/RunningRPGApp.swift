//
//  RunningRPGApp.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI
import SwiftData

@main
struct RunningRPGApp: App {

    var body: some Scene {
        
        // TODO: Tabbar (이얏호)
        WindowGroup {
            MainTabView()
        }
    }
}

struct MainTabView: View {
    
    @State private var selectedIndex = 1
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ShopView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("ShopView")
                }
                .tag(0)
            
            HomeView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("HomeView")
                }
                .tag(1)
            
            MonsterListView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("MonsterListView")
                }
                .tag(2)
        }
    }
}


#Preview {
    MainTabView()
        .modelContainer(for: Item.self, inMemory: true)
}
