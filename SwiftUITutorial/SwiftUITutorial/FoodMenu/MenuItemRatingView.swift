//
//  MenuItemRatingView.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import SwiftUI

struct MenuItemRatingView: View {
	@State var rating: Int
	private let maxRating: Int = 5
	
	var body: some View {
		HStack {
			ForEach(1..<maxRating + 1, id: \.self) { value in
				Image(systemName: "star")
					.scaledToFit()
					.foregroundStyle(.blue)
					.symbolVariant(value <= rating ? .fill : .none)
					.onTapGesture {
						if value == rating {
							rating = 0
						} else {
							rating = value
						}
					}
			}
		}
	}
}
