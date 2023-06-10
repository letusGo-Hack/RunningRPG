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

    @State var currentActivity: Activity<RunAttributes>! = nil
    
    @State var activityViewState: ActivityViewState? = nil
    
    
    let character: Character = Character(name: "rpg", avatar: "human_small", damage: 1, equiment: .init(damage: 1, category: 1, name: "rpg"), walkCount: 0)
    
    var body: some View {
        NavigationView {
            VStack {
                Button("test") {
                    self.initialRunActivity(character: character)
                }
                
                Button("update") {
                    self.updateRunButtonTapped()
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
    
    private func observeActivity(activity: Activity<RunAttributes>) {
        Task {
            for await activityState in activity.activityStateUpdates {
                if activityState == .dismissed {
                    debugPrint("CleanUp Here")
                }
            }
        }
    }
    
    private func initialRunActivity(character: Character) {
        
        do {
            let run = RunAttributes(character: character)
            
            let monster = Monster.generatMock()
            let initial = RunAttributes.ContentState(monster: monster[0])
            
            let activity = try Activity.request(
                attributes: run,
                contentState: initial,
                pushType: nil
            )
            
            setUp(withActivity: activity)
            
            print(activity)
        } catch {
            print(error)
        }
    }
    
    private func setUp(withActivity activity: Activity<RunAttributes>) {
        self.currentActivity = activity
        
        self.activityViewState = .init(activityState: activity.activityState, contentState: activity.content.state)
        
        observeActivity(activity: activity)
    }
    
    func updateRunButtonTapped() {
        Task {
            defer {
                self.activityViewState?.updateControlDisabled = false
            }
            
            self.activityViewState?.updateControlDisabled = true
            try await self.update()
        }
    }
    
    private func update() async throws {
        do {
            
            let run = RunAttributes(character: character)
            let oldMonster = currentActivity.content.state.monster
            var monster = Monster(
                name: oldMonster.name,
                hp: oldMonster.hp,
                currentHp: oldMonster.currentHp - 10,
                avatar: oldMonster.avatar,
                level: oldMonster.level,
                isOpen: oldMonster.isOpen
            )
            
            print(monster)
            
            let contentState = RunAttributes.ContentState(monster: monster)
            
            await currentActivity.update(
                ActivityContent<RunAttributes.ContentState>(
                    state: contentState,
                    staleDate: nil
                )
                                
            )
        } catch {
            print(error)
        }
    }
}

#Preview {
    ShopView()
        .modelContainer(for: Item.self, inMemory: true)
}


struct ActivityViewState: Sendable {
    var activityState: ActivityState
    var contentState: RunAttributes.ContentState
    var pushToken: String? = nil
    
    var shouldShowEndControls: Bool {
        switch activityState {
        case .active, .stale:
            return true
        case .ended, .dismissed:
            return false
        @unknown default:
            return false
        }
    }
    
    var updateControlDisabled: Bool = false
    
    var shouldShowUpdateControls: Bool {
        switch activityState {
        case .active, .stale:
            return true
        case .ended, .dismissed:
            return false
        @unknown default:
            return false
        }
    }
    
    var isStale: Bool {
        return activityState == .stale
    }
}
