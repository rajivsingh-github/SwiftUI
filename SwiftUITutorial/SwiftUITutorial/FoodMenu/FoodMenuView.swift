//
//  FoodMenuView.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import SwiftUI

struct FoodMenuCell: View {
	let menuItem: MenuItem
	var body: some View {
		Text(menuItem.name)
			.padding()
	}
}

struct FoodMenuView: View {
	@StateObject var viewModel: FoodMenuViewModel
	
	var body: some View {
		NavigationStack {
			switch viewModel.state {
			case .loading:
				ProgressView("Please wait while we fetch the Food Menu...")
			case .loaded(let menuSection):
				List(menuSection, id: \.name) { section in
					Section(section.name) {
						ForEach(section.items, id: \.name) { item in
							FoodMenuCell(menuItem: item)
						}
					}
				}
				.listStyle(.grouped)
				.navigationTitle("Food Menu")
			case .failed(let error):
				Text(error.localizedDescription)
					.padding()
			case .idle:
				Color.clear.onAppear {
					Task {
						await viewModel.getFoodMenu()
					}
				}
			}
		}
		
		.task {
			await viewModel.getFoodMenu()
		}
	}
}
