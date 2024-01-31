//
//  FoodMenuViewModel.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import Foundation

protocol FoodMenuViewModeling {
	func getFoodMenu() async
}

@MainActor
class FoodMenuViewModel: ObservableObject, FoodMenuViewModeling {
	enum State {
		case idle
		case loading
		case loaded([MenuSection])
		case failed(Error)
	}
	
	let modelManager: FetchMenuModelManagerProtocol
	@Published var state: State = .idle
	
	init(modelManager: FetchMenuModelManagerProtocol) {
		self.modelManager = modelManager
	}
	
	func getFoodMenu() async {
		do {
			state = .loading
			let items = try await modelManager.fetchFoodMenu()
			state = .loaded(items)
		} catch {
			state = .failed(error)
		}
	}
}
