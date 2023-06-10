//
//  RunningRPGWidget.swift
//  RunningRPGWidget
//
//  Created by 강주원 on 2023/06/10.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for offset in 0 ..< 5 {
			let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
		
		//

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
	let monsters: [String]
}

struct RunningRPGWidgetEntryView : View {
	@Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry

	@ViewBuilder
    var body: some View {
//        VStack {
//			Image("human")
//			Image("monster_ squirrel")
//			Image("human")
//        }
		HStack {
			Image("monster_ squirrel")
		}


			.containerBackground(.fill.tertiary, for: .widget)
    }
}

struct RunningRPGWidget: Widget {
    let kind: String = "RunningRPGWidget"

    var body: some WidgetConfiguration {
		AppIntentConfiguration(
			kind: kind,
			intent: ConfigurationAppIntent.self,
			provider: Provider()) { entry in
		RunningRPGWidgetEntryView(entry: entry)}
			.configurationDisplayName("RunningRPG Widget")
		
			.description("This is RunningRPG Widget.")
		//origin
//        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
//            RunningRPGWidgetEntryView(entry: entry)
//        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    RunningRPGWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .smiley)
    SimpleEntry(date: .now, configuration: .starEyes)
}
