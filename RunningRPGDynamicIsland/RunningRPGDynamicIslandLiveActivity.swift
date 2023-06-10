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
        var pitch: Double?
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RunningRPGDynamicIslandLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RunAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.white)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.bottom) {
                    VStack {
                        HStack(alignment: .center, spacing: .zero) {
                            let _ = print(context.attributes.character)
                            let _ = print(context.state.monster)
                            Image(context.attributes.character.avatar)
                                .resizable()
                                .frame(width: 37, height: 58)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(context.state.monster.currentHp)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(.white)
                                Text("/\(context.state.monster.hp)")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundStyle(.white)
                            }
                            
                            Spacer()
                            
                            Image(context.state.monster.avatar)
                                .resizable()
                                .frame(width: 52, height: 46)
                        }
                        
                        ProgressView(value: 50, total: 100)
                        .progressViewStyle(.linear)
                        .tint(Color.red)
//                        .scaleEffect(x: 0, y: 2, anchor: .center)
                    }
                    
                    // more content
                }
            } compactLeading: {
                Image("human_small")
                    .resizable()
                    .scaledToFit()
            } compactTrailing: {
                Image("monster_pizza_small")
                    .resizable()
                    .scaledToFit()
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
