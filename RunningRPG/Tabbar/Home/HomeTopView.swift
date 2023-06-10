//
//  HomeTopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI

struct HomeTopView: View {
    var body: some View {
//        Rectangle().background(Color.red)
        VStack {
            Image("forestBG")
                .resizable()
                .scaledToFit()
            
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 150, height: 150)
        }
//        ZStack {
//            Image("forestBG")
//                .background(Color.red)
//
////            HStack {
////                
////            }
//        }
//        .background(Color.red)
    }
}

#Preview {
    HomeTopView()
}
