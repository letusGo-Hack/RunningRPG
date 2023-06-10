//
//  RunningRPGWidgetLiveActivity.swift
//  RunningRPGWidget
//
//  Created by 강주원 on 2023/06/10.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RunningRPGWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RunningRPGWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RunningRPGWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension RunningRPGWidgetAttributes {
    fileprivate static var preview: RunningRPGWidgetAttributes {
        RunningRPGWidgetAttributes(name: "World")
    }
}

extension RunningRPGWidgetAttributes.ContentState {
    fileprivate static var smiley: RunningRPGWidgetAttributes.ContentState {
        RunningRPGWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RunningRPGWidgetAttributes.ContentState {
         RunningRPGWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RunningRPGWidgetAttributes.preview) {
   RunningRPGWidgetLiveActivity()
} contentStates: {
    RunningRPGWidgetAttributes.ContentState.smiley
    RunningRPGWidgetAttributes.ContentState.starEyes
}
