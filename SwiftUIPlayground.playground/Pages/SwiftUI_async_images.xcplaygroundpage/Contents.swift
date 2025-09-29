//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_async_images: View {
	var body: some View {
		VStack{
			AsyncImage(url: URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_120x44dp.png")) { image in
				image.resizable()
//					.aspectRatio(contentMode: .fit)
					.frame(width: 200, height: 80)
					.shadow(radius: 5)
			} placeholder: {
				ProgressView()
			}
		}
	}
}

PlaygroundPage.current.setLiveView(
	SwiftUI_async_images()
		.frame(width: 390, height: 844)
)

//: [Next](@next)
