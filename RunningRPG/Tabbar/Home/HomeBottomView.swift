//
//  HomeBottomView.swift
//  RunningRPG
//
//  Created by 강주원 on 2023/06/10.
//

import SwiftUI
import ActivityKit

struct HomeBottomView: View {
    
    var body: some View {
		VStack {
            
			HStack {
                
                
				VStack { //left side equiptment
					Image(systemName: "person")
                        .frame(minHeight: 0, maxHeight: .infinity)
                    
					Image(systemName: "person")
                        .frame(minHeight: 0, maxHeight: .infinity)
                    
					Image(systemName: "person")
                        .frame(minHeight: 0, maxHeight: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
				
                VStack {
                    Text("My Damage")
//                        .padding(.bottom, 30)
                        .font(.system(size: 22))
                        .bold()
                        .foregroundColor(.red)
                        .frame(minHeight: 0, maxHeight: 50)
                    
                    
                    Image("human") //center
                        .frame(minHeight: 0, maxHeight: .infinity)
                }
                
				VStack { //right side equiptment
					Image(systemName: "person.fill")
                        .frame(minHeight: 0, maxHeight: .infinity)
                    
					Image(systemName: "person.fill")
                        .frame(minHeight: 0, maxHeight: .infinity)
                    
					Image(systemName: "person.fill")
                        .frame(minHeight: 0, maxHeight: .infinity)
				}
                .frame(minWidth: 0, maxWidth: .infinity)
			}
		}
		
    }
}

#Preview {
    HomeBottomView()
}


