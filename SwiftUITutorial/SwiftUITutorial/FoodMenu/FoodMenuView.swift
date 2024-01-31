//
//  FoodMenuView.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import SwiftUI

struct FoodMenuCell: View {
	private static let restrictionColors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
	
	let menuItem: MenuItem
	var body: some View {
		HStack {
			Image(menuItem.thumbnailImageName, bundle: nil)
				.clipShape(Circle())
			
			VStack(alignment: .leading) {
				Text(menuItem.name)
					.font(.title)
				Text(menuItem.price, format: .currency(code: "USD"))
			}
			.padding()
			
			Spacer()
			
			ForEach(menuItem.restrictions, id: \.self) { restriction in
				Text(restriction.rawValue)
					.font(.caption)
					.fontWeight(.black)
					.padding(5)
					.background(FoodMenuCell.restrictionColors[restriction.rawValue, default: .black])
					.clipShape(Circle())
					.foregroundStyle(.white)
				
			}
		}
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
							// 1.1 Create a navigation link and attach menu item to it.
							NavigationLink(value: item) {
								FoodMenuCell(menuItem: item)
							}
						}
					}
				}
				.listStyle(.grouped)
				.navigationTitle("Food Menu")
				// 1.2 Create a navigation destination that tells SwiftUI -
				// When you're asked to navigate to a MenuItem, load MenuItemView with that value.
				.navigationDestination(for: MenuItem.self) { item in
					MenuItemView(menuItem: item)
				}
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
