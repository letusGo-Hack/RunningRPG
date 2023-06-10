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
            TabView {
                ShopView()
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("ShopView")
                    }
                
                HomeView()
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("HomeView")
                    }
                
                MonsterListView()
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("MonsterListView")
                    }
            }
        }
        .modelContainer(for: Item.self)
    }
}
