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
                    Image(systemName: "cart")
                    Text("Shop")
                }
                .tag(0)
            
            HomeView()
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Fight")
                }
                .tag(1)
            
            MonsterListView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("MonsterList")
                }
                .tag(2)
        }
    }
}


#Preview {
    MainTabView()
        .modelContainer(for: Item.self, inMemory: true)
}
