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
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 150, height: 150)
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
