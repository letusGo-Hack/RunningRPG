//
//  RunningRPGDynamicIsland.swift
//  RunningRPGDynamicIsland
//
//  Created by min on 2023/06/10.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct RunningRPGDynamicIslandEntryView : View {
    var entry: Provider.Entry

    var testItems: [MonsterListItem] = MonsterListItem.generateKilledMonsters()
    
    @ViewBuilder
    var body: some View {
        
        //        VStack {
        //            Image("human")
        //            Image("monster_ squirrel")
        //            Image("human")
        //        }
        HStack {
            ForEach(testItems) { item in
                Image(item.monster.avatar)
            }
        }
    }
}

struct RunningRPGDynamicIsland: Widget {
    let kind: String = "RunningRPGDynamicIsland"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            RunningRPGDynamicIslandEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct RunningRPGDynamicIsland_Previews: PreviewProvider {
    static var previews: some View {
        RunningRPGDynamicIslandEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
