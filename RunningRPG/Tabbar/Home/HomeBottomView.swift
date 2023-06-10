//
//  HomeBottomView.swift
//  RunningRPG
//
//  Created by 강주원 on 2023/06/10.
//

import SwiftUI

struct HomeBottomView: View {
    var body: some View {
		HStack {
			VStack { //left side equiptment
				Image(systemName: "person")
				Image(systemName: "person")
				Image(systemName: "person")
			}
			HStack { //center
				Image(systemName: "cloud.fill")
			}
			
			VStack { //right side equiptment
				Image(systemName: "person.fill")
				Image(systemName: "person.fill")
				Image(systemName: "person.fill")
			}
			
		}
    }
}

#Preview {
    HomeBottomView()
}
