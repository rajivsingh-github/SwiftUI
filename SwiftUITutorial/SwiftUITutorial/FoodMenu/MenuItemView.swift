//
//  MenuItemView.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import SwiftUI

struct MenuItemView: View {
	let menuItem: MenuItem
	
	var body: some View {
		VStack {
			VStack(alignment: .trailing) {
				ZStack(alignment: .bottomTrailing) {
					Image(menuItem.mainImageName)
					Text(menuItem.photoCredit)
						.font(.caption)
						.background(.black)
						.foregroundStyle(.white)
						.padding()
				}
				MenuItemRatingView(rating: menuItem.rating)
					.padding([.trailing])
			}
			Text(menuItem.description)
				.padding()
			Spacer()
		}
		.navigationTitle(menuItem.name)
	}
}
