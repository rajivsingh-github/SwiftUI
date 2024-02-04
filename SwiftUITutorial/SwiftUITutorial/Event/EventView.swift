//
//  EventView.swift
//  SwiftUITutorial
//
//  Created by Singh, Rajiv on 1/25/24.
//

import SwiftUI

struct Event {
	let title: String
	let date: Date
	let location: String
	let symbol: String
}

struct EventView: View {
	let event: Event
	var body: some View {
		HStack(alignment: .firstTextBaseline) {
			Image(systemName: event.symbol)
			
			VStack(alignment: .leading) {
				Text(event.title)
					.font(.title)
				Text(
					event.date,
					format: Date.FormatStyle()
						.day(.defaultDigits)
						.month(.wide)
				)
				Text(event.location)
			}
		}
		.padding()
		.background {
			ZStack(alignment: .top) {
				Rectangle()
					.frame(maxHeight: 15.0)
				Rectangle()
					.opacity(0.3)
			}
			.foregroundColor(.teal)
		}
		.clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
	}
}

struct EventView_Preview: PreviewProvider {
	static let event = Event(title: "Flowers", date: .now, location: "Italy", symbol: "gift")
	static var previews: some View {
		EventView(event: event)
	}
}
