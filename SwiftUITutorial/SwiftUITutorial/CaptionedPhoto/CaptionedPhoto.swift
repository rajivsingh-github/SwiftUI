//
//  CaptionedPhoto.swift
//  SwiftUITutorial
//
//  Created by Singh, Rajiv on 1/25/24.
//

import SwiftUI

struct CaptionedPhoto: View {
	let assetName: String
	let captionText: String
	var body: some View {
		Image(assetName)
			.resizable()
			.scaledToFit()
			.overlay(alignment: .bottom) {
				Caption(text: captionText)
			}
			.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
			.padding()
	}
}

struct Caption: View {
	let text: String
	
	var body: some View {
		Text(text)
			.padding()
			.foregroundStyle(.white)
			.background(Color.black.opacity(0.75),
								in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
			.padding()
	}
}

struct CaptionedPhoto_Preview: PreviewProvider {
	static let imageName = "veggie-pizza"
	static let caption = "This photo is wider than it is tall."
	
	static var previews: some View {
		CaptionedPhoto(assetName: imageName, captionText: caption)
	}
}
