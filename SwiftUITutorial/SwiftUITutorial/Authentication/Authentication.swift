//
//  Authentication.swift
//  SwiftUITutorial
//
//  Created by Singh, Rajiv on 1/25/24.
//

import SwiftUI

struct LoginView: View {
	@Binding var viewModel: LoginViewModel
	
	var body: some View {
		VStack {
			Spacer()
			
			VStack(alignment: .center) {
				TextField("", text: $viewModel.username)
					.autocorrectionDisabled()
					.textInputAutocapitalization(.never)
					.padding()
				
				Divider()
				
				SecureField("", text: $viewModel.password)
					.padding()
				
				Divider()
			}
			
			Spacer()
			
			Button("Login") {
				viewModel.onLogin()
			}
			.font(.title)
			.frame(maxWidth: .infinity, maxHeight: 60)
			.foregroundStyle(.white)
			.background(Color.blue)
			.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
			.padding()
		}
		.padding([.bottom], 30)
	}
}

struct LoginViewModel {
	var username: String
	var password: String
	
	init(username: String, password: String) {
		self.username = username
		self.password = password
	}
	
	func onLogin() {
		print("\(username) & \(password)")
	}
}

struct LoginView_Preview: PreviewProvider {
	@State static var viewModel = LoginViewModel(username: "123", password: "abc")
	
	static var previews: some View {
		LoginView(viewModel: $viewModel)
	}
}
