//: [Previous](@previous)
/*:
 ## @EnvironmentObject
 @EnvironmentObject property wrapper. This lets us share model data anywhere it’s needed, while also ensuring that our views automatically stay updated when that data changes.
 Rather than creating some data in view A, then passing it to view B, then view C, then view D before finally using it, you can create it in view A and put it into the environment so that views B, C, and D will automatically have access to it.
 Just like @ObservedObject, you never assign a value to an @EnvironmentObject property. Instead, it should be passed in from elsewhere, and ultimately you’re probably going to want to use @StateObject to create it somewhere.
 However, unlike @ObservedObject we don’t pass our objects into other views by hand. Instead, we use send the data into a modifier called environmentObject(), which makes the object available in SwiftUI’s environment for that view plus any others inside it.
 > Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.
 */
/*:
 To demonstrate environment objects, we’re going to define three things:

 A GameSettings class that contains a single published property called score.
 A ScoreView view that expects to receive a GameSettings object in the environment, and displays its score property.
 A ContentView view that creates a GameSettings object, has a button to add 1 to its score property, and a NavigationLink to show the detail view.
 Here’s the code:
 */
import SwiftUI
import PlaygroundSupport
	// Our observable object class
class GameSettings: ObservableObject {
	@Published var score = 0
}

	// A view that expects to find a GameSettings object
	// in the environment, and shows its score.
struct ScoreView: View {
	@EnvironmentObject var settings: GameSettings
	@Environment(\.colorScheme) private var colorScheme

	var body: some View {
		Text("Score: \(settings.score)")
		if colorScheme == .dark { // Checks the wrapped value from the environment Property Wrapper.
			Text("Dark mode enabled")
		} else {
			Text("Light mode enabled")
		}
	}
}

	// A view that creates the GameSettings object,
	// and places it into the environment for the
	// navigation stack.
struct EnvironmentObjectContentView: View {
	@StateObject var settings = GameSettings()

	var body: some View {
		NavigationStack {
			VStack {
					// A button that writes to the environment settings
				Button("Increase Score") {
					settings.score += 1
				}

				NavigationLink {
					ScoreView()
				} label: {
					Text("Show Detail View")
				}
			}
			.frame(height: 200)
		}
		.environmentObject(settings)
		.preferredColorScheme(.light)
	}
}
PlaygroundPage.current.setLiveView(
	EnvironmentObjectContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
