//
//  HomeBottomView.swift
//  RunningRPG
//
//  Created by 강주원 on 2023/06/10.
//

import SwiftUI
import ActivityKit

struct HomeBottomView: View {
    
    let equipmentSpacing: CGFloat = 18
    let equipmentSize: CGFloat = 40
    
    var body: some View {
		VStack {
            
			HStack {
                VStack(spacing: equipmentSpacing) { //left side equiptment
					Image(systemName: "person")
                        .frame(width: equipmentSize, height: equipmentSize)
                        .foregroundColor(.orange)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.orange, lineWidth: 5)
                        )
                    
					Image(systemName: "person")
                        .frame(width: equipmentSize, height: equipmentSize)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue, lineWidth: 5)
                        )
                    
					Image(systemName: "person")
                        .frame(width: equipmentSize, height: equipmentSize)
                        .foregroundColor(.orange)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.orange, lineWidth: 5)
                        )
                }
                .frame(minWidth: 0, maxWidth: .infinity)
				
                VStack {
                    Text("My Damage")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.red)
                    Text("1")
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.red)
                    
                    
                    Image("human") //center
                        .frame(minHeight: 0, maxHeight: .infinity)
                    
                    Button {
                        let step = CoreMotionService.shared.steps.intValue
                        CoreMotionService.shared.steps = (step + 1) as NSNumber
                    } label: {
                        Text("Add 1 Step")
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.blue, lineWidth: 2)
                    )

                }
                
				VStack(spacing: equipmentSpacing) { //right side equiptment
					Image(systemName: "person.fill")
                        .frame(width: equipmentSize, height: equipmentSize)
                        .foregroundColor(.orange)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.orange, lineWidth: 5)
                        )
                    
					Image(systemName: "person.fill")
                        .frame(width: equipmentSize, height: equipmentSize)
                        .foregroundColor(.purple)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                    
					Image(systemName: "person.fill")
                        .frame(width: equipmentSize, height: equipmentSize)
                        .foregroundColor(.purple)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.purple, lineWidth: 5)
                        )
				}
                .frame(minWidth: 0, maxWidth: .infinity)
			}
		}
		
    }
}

#Preview {
    HomeBottomView()
}


