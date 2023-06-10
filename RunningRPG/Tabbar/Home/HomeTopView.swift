//
//  HomeTopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import SwiftUI

struct HomeTopView: View {
    var body: some View {
        
        ZStack {
            Image("forestBG")
                .resizable()
                .scaledToFit()
            
            HStack {
                Image("human")
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 150, height: 150)
                
                VStack {
                    
                    HStack(spacing: 0) {
                        
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 50, height: 10)
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 50, height: 10)
                        
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
