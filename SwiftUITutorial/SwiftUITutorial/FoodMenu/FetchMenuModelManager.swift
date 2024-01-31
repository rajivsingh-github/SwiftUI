//
//  FetchMenuModelManager.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import Foundation

enum FetchFoodMenuError: Error {
	case badURL
	case unknown
}

protocol FetchMenuModelManagerProtocol {
	func fetchFoodMenu() async throws -> [MenuSection]
}

struct FetchMenuModelManager: FetchMenuModelManagerProtocol {
	func fetchFoodMenu() async throws -> [MenuSection] {
		guard let _ = URL(string: "https://www.example.com") else {
			throw FetchFoodMenuError.badURL
		}
		
		//let (data, _) = try await URLSession.shared.data(from: url)
		
		try await Task.sleep(for: .seconds(3))
		
		guard let menuPath = Bundle.main.url(forResource: "menu", withExtension: "json") else {
			throw FetchFoodMenuError.unknown
		}
		
		let items = try Data.init(contentsOf: menuPath)
		
		let menuItems = try JSONDecoder().decode([MenuSection].self, from: items)
		
		return menuItems
	}
}
