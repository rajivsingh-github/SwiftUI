//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Rajiv Singh on 1/31/24.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    var body: some Scene {
        WindowGroup {
			let modelManager = FetchMenuModelManager()
			let viewModel = FoodMenuViewModel(modelManager: modelManager)
            FoodMenuView(viewModel: viewModel)
        }
    }
}
