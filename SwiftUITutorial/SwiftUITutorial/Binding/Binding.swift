//
//  Binding.swift
//  SwiftUITutorial
//
//  Created by Singh, Rajiv on 1/25/24.
//

import SwiftUI

struct NumberView: View {
	@State var stepperValue = 0
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Current stepper value is: \(stepperValue)")
			StepperView(stepperValue: $stepperValue)
		}
		.padding()
	}
}

struct StepperView: View {
	@Binding var stepperValue: Int
	var body: some View {
		VStack {
			Stepper(value: $stepperValue, in: 0...10) {
				Text("Stepper value in child is: \(stepperValue)")
			}
		}
	}
}

#Preview {
	NumberView()
}
