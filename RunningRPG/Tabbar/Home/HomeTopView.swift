//
//  HomeTopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//



import SwiftUI

import CoreMotion
import ActivityKit


struct HomeTopView: View {
    
    var preStepCount = 0
    
    @State var currentActivity: Activity<RunAttributes>! = nil
    @State var activityViewState: ActivityViewState? = nil
    let character: Character = Character(name: "rpg", avatar: "human_small", damage: 0.5, equiment: .init(damage: 0, category: 1, name: "rpg"), walkCount: 0)
    
    @ObservedObject private var stepsOO = CoreMotionService.shared
    
    var char = Character(
        name: "dumm",
        avatar: "avatar",
        damage: 1,
        equiment: Equiment(damage: 1, category: -1, name: ""),
        walkCount: 111
    )
    
    var mob = MonsterListItem.generateMonsters().first!
    
    func getHPPercent() -> Double {
        let step = Int(truncating: stepsOO.steps) - preStepCount
        let damage = char.damage * Double(step)
        let hp = mob.monster.hp
        
        return (hp - damage) / hp
    }
    
    var body: some View {
        ZStack {
            Image("forestBG")
                .resizable()
                .scaledToFit()
                .frame(minHeight: 0, maxHeight: .infinity)
            
            HStack {
                Image("human")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    
                    Text("걸음수 : \(stepsOO.steps)")
                        .background(Color.white)
                        .onChange(of: stepsOO.steps) { _ in
                            print("inin")
                            self.updateRunButtonTapped()
                        }
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 150, height: 150)
                    
                    Button("test") {
                        self.initialRunActivity(character: character)
                    }
                    .foregroundStyle(.white)
                    
                    Button("end") {
                        self.endAdventureButtonTapped()
                    }
                    .foregroundStyle(.white)
                }
                VStack {
                    ZStack {
                        HStack(spacing: 0) {
                            
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 100 * getHPPercent(), height: 13)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 100 - 100 * getHPPercent(), height: 13)
                            
                        }
                        
                        Text("\(Int(mob.monster.hp))")
    
                    }
                    
                    Image("monster_ squirrel")
                        .resizable()
                        .scaledToFit()
                    
                }
                
            }
        }
    }
}

#Preview {
    HomeTopView()
}


extension HomeTopView {
    private func observeActivity(activity: Activity<RunAttributes>) {
        Task {
            for await activityState in activity.activityStateUpdates {
                if activityState == .dismissed {
                    debugPrint("CleanUp Here")
                }
            }
        }
    }
    
    func initialRunActivity(character: Character) {
        
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
    
    func setUp(withActivity activity: Activity<RunAttributes>) {
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
    
    func update() async throws {
        do {
            let run = RunAttributes(character: character)
            
            let oldMonster = currentActivity.content.state.monster
            
            let currentHp = oldMonster.currentHp - (Double(stepsOO.steps) * run.character.damage)
            
            print("currentHp : \(currentHp)")
            
            var monster = Monster(
                name: oldMonster.name,
                hp: oldMonster.hp,
                currentHp: currentHp,
                avatar: oldMonster.avatar,
                level: oldMonster.level,
                isOpen: oldMonster.isOpen
            )
            
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
    
    func endAdventureButtonTapped() {
        Task {
            try await self.endActivity()
        }
    }
    
    func endActivity() async throws {
        let monster = currentActivity.content.state.monster
        
        let finalContent = RunAttributes.ContentState(
            monster: monster
        )
        
        let dismissalPolicy: ActivityUIDismissalPolicy = .default
        
        await currentActivity.end(
            ActivityContent(state: finalContent, staleDate: nil),
            dismissalPolicy: dismissalPolicy
        )
    }
}
