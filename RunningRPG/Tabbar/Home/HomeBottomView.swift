//
//  HomeBottomView.swift
//  RunningRPG
//
//  Created by 강주원 on 2023/06/10.
//

import SwiftUI

struct HomeBottomView: View {
    var body: some View {
		VStack {
//			HStack {
//				//Damage View
//				Text("Damage: ")
//
//				Text("test")
//			}
			Text("My Damage")
				.padding(.bottom, 30)
				.font(.system(size: 22))
				.bold()
				.foregroundColor(.red)
			//Equipments & Character View
			HStack {
				VStack { //left side equiptment
					Image(systemName: "person")
					Image(systemName: "person")
						.padding(.top, 10)
					Image(systemName: "person")
						.padding(.top, 10)
				}
				
				Image("human") //center
					.padding(.leading, 30)
					.padding(.trailing, 30)
				
				VStack { //right side equiptment
					Image(systemName: "person.fill")
					Image(systemName: "person.fill")
						.padding(.top, 10)
					Image(systemName: "person.fill")
						.padding(.top, 10)
				}
			}
		}
		
    }
}

#Preview {
    HomeBottomView()
}
