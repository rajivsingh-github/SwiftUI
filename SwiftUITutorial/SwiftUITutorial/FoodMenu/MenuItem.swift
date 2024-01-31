//
//  MenuItem.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import Foundation

enum FoodRestriction: String, Decodable {
	case gluten = "G"
	case vegan = "V"
	case nuts = "N"
	case dairyFree = "D"
	case sugar = "S"
}

struct MenuSection: Decodable {
	let name: String
	let items: [MenuItem]
}

struct MenuItem: Decodable, Hashable {
	let name: String
	let photoCredit: String
	let price: Int
	
	var restrictions: [FoodRestriction]
	var description: String
	
	var mainImageName: String {
		name.replacingOccurrences(of: " ", with: "-").lowercased()
	}
	
	var thumbnailImageName: String {
		"\(mainImageName)-thumb"
	}
	
	var rating: Int {
		return 3
	}
}
