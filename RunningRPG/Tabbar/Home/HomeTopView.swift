//
//  HomeTopView.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//



import SwiftUI
import CoreMotion

struct HomeTopView: View {
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()

    @State private var pitch = Double.zero
    @State private var yaw = Double.zero
    @State private var roll = Double.zero
    
    
    var body: some View {
        
        ZStack {
            Image("forestBG")
                .resizable()
                .scaledToFit()
            
            HStack {
                Image("human")
                    .resizable()
                    .scaledToFit()
                
                VStack {
                    
                    Text("걸음수 : \(pitch)")
                        .background(Color.white)
                    
                    Text("걸음수 : \(yaw)")
                        .background(Color.white)
                    
                    Text("걸음수 : \(roll)")
                        .background(Color.white)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 150, height: 150)
                }
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
        }.onAppear {
            self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
                guard let data = data else {
                    print("Error: \(error!)")
                    return
                }
                let attitude: CMAttitude = data.attitude
                
                print("pitch: \(attitude.pitch)")
                print("yaw: \(attitude.yaw)")
                print("roll: \(attitude.roll)")
                
                DispatchQueue.main.async {
                    self.pitch = attitude.pitch
                    self.yaw = attitude.yaw
                    self.roll = attitude.roll
                }
            }
        }
    }
}

#Preview {
    HomeTopView()
}
