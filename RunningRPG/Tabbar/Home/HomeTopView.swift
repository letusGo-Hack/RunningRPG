//
//  HomeTopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//



import SwiftUI

import CoreMotion
import ActivityKit

class HomeViewModel: ObservableObject {
    
    @Published var char = Character(
        name: "",
        avatar: "",
        damage: 1,
        equiment: Equiment(damage: -1, category: -1, name: ""),
        walkCount: -1
    )
    
    var preStepCount: Int = 0
    var mob = MonsterListItem.generateMonsters().first!
    
    @Published var mobHpPercent: Double = 1
    
    
    func takeStep(_ stepsCount: Int) {
    
        print("stepsCount: \(stepsCount)")
        
        let takeStep = stepsCount - preStepCount
        setPreStepCount(stepsCount)
        print("takeStep: \(takeStep)")
        
        let damage = char.damage * Double(takeStep)
        print("damage: \(damage)")
        
        let currentHp = mob.monster.currentHp
        var calculatedHp = currentHp - damage
        if calculatedHp < 0 { calculatedHp = 0 }
        mob.monster.currentHp = calculatedHp
        print("calculatedHp: \(calculatedHp)")
        
        mobHpPercent = calculatedHp / mob.monster.hp
        print("mobHpPercent: \(mobHpPercent)\n")
    }
    
    init() {
        print("ViewModel init!")
    }
    
    private func setPreStepCount(_ count: Int) {
        preStepCount = count
    }
}

struct HomeTopView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    @ObservedObject private var stepsOO = CoreMotionService.shared
    
    
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
                                .frame(width: 100 * viewModel.mobHpPercent, height: 13)
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 100 - 100 * viewModel.mobHpPercent, height: 13)
                            
                        }
                        
                        Text("\(Int(viewModel.mob.monster.hp))")
                        
                    }
                    
                    Image("monster_ squirrel")
                        .resizable()
                        .scaledToFit()
                    
                }
                
            }
        }
        .onReceive(stepsOO.$steps) { value in
            viewModel.takeStep(value.intValue)
        }
    }
}

#Preview {
    HomeTopView()
}
