//
//  CoreMotionService.swift
//  RunningRPG
//
//  Created by ParkYoungHo on 2023/06/10.
//

import UIKit
import CoreMotion

class CoreMotionService: ObservableObject {
    
    static let shared = CoreMotionService()
    
    private var motionManager = CMMotionManager()
    private var pedoMeter = CMPedometer()
    
    @Published var steps: NSNumber = 0
    
    private init() {
        
        motionManager.deviceMotionUpdateInterval = 60
        
        motionManager.startDeviceMotionUpdates(
            to: OperationQueue.current!,
            withHandler: {(
                deviceMotion: CMDeviceMotion!,
                error: Error!
            ) -> Void in
                print(deviceMotion.gravity)
            }
        )
        
        pedoMeter.startUpdates(from: Date()) { [unowned self] data, error in
            if error == nil {
                if let response = data {
                    print(response.numberOfSteps)
                }
            }
            
            DispatchQueue.main.async {
                self.steps = data?.numberOfSteps ?? 0
            }
        }

    }
    
}

