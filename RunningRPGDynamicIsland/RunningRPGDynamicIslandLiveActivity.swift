//
//  RunningRPGDynamicIslandLiveActivity.swift
//  RunningRPGDynamicIsland
//
//  Created by min on 2023/06/10.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RunningRPGDynamicIslandAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RunningRPGDynamicIslandLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RunningRPGDynamicIslandAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        Image("human_small")
                        ProgressView(value: 1, total: 1) {
                            Text("TEST")
                        }
                        .progressViewStyle(.circular)
                        .tint(Color.red)
                    }
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct RunningRPGDynamicIslandLiveActivity_Previews: PreviewProvider {
    static let attributes = RunningRPGDynamicIslandAttributes(name: "Me")
    static let contentState = RunningRPGDynamicIslandAttributes.ContentState(value: 3)

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
