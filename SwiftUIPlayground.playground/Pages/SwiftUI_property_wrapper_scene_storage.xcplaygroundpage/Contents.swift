//: [Previous](@previous)
/*:
 ## @SceneStorage
 @SceneStorage is a property wrapper introduced in SwiftUI for managing the state of a view across different scenes in a multi-window or multi-device environment. It’s particularly useful for preserving the state of a view when it moves between scenes, such as when the user switches between different windows or devices.
 */
import SwiftUI
import PlaygroundSupport
struct SceneContentView: View {
	@SceneStorage("isDarkModeOn") private var isDarkModeOn = true

	var body: some View {
		VStack {
			Toggle("Dark Mode", isOn: $isDarkModeOn)
				.padding()
			Text("Current mode: \(isDarkModeOn ? "Dark" : "Light")")
				.padding()
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(isDarkModeOn ? Color.black : Color.white)
		.foregroundColor(isDarkModeOn ? Color.white : Color.black)
	}
}

PlaygroundPage.current.setLiveView(
	SceneContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
