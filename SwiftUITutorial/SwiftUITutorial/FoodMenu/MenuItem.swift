//
//  MenuItem.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import Foundation

struct MenuSection: Decodable {
	let name: String
	let items: [MenuItem]
}

struct MenuItem: Decodable {
	let name: String
	let photoCredit: String
	let price: Int
	var restrictions: [String]
	var description: String
	
	var mainImageName: String {
		name.replacingOccurrences(of: " ", with: "-").lowercased()
	}
	
	var thumbnailImageName: String {
		"\(mainImageName)-thumb"
	}
}
