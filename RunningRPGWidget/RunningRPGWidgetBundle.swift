//
//  RunningRPGWidgetBundle.swift
//  RunningRPGWidget
//
//  Created by 강주원 on 2023/06/10.
//

import WidgetKit
import SwiftUI

@main
struct RunningRPGWidgetBundle: WidgetBundle {
    var body: some Widget {
        RunningRPGWidget()
        RunningRPGWidgetLiveActivity()
    }
}
