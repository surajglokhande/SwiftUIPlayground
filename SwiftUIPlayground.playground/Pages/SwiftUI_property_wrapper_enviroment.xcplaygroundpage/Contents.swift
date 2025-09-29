//: [Previous](@previous)
/*:
 ## @Environment
 @Environment lets us read data from the system, such as color scheme, accessibility options, and trait collections, but you can add your own keys here if you want. This does not own its data.
 @EnvironmentObject allows us to inject arbitrary values into the environment, @Environment is specifically there to work with SwiftUI’s own pre-defined keys.
 */
/*:
 For example, you can read the color scheme value and automatically get your view updated when the color scheme changes:
 */
import SwiftUI
import PlaygroundSupport
struct ColorSchemeView: View {
	@Environment(\.colorScheme) private var colorScheme

	var body: some View {
		if colorScheme == .dark { // Checks the wrapped value from the environment Property Wrapper.
			Text("Dark mode enabled")
		} else {
			Text("Light mode enabled")
		}
	}
}
PlaygroundPage.current.setLiveView(
	ColorSchemeView()
	//.environment(ColorScheme(.light))
		.frame(width: 390, height: 844)
		.preferredColorScheme(.dark)
)
/*:
 For example, Injecting custom objects into a view’s environment:
 */
struct Theme: ShapeStyle {
	var primaryColor: UIColor
}
class ThemeProvider: Observable {
	var currentTheme: Theme = Theme(primaryColor: .green)
}

struct ThemedView: View {

	@Environment(ThemeProvider.self) private var themeProvider: ThemeProvider?

	var body: some View {
		Text("This text is using the theme's primary color")
			.foregroundStyle(Color(themeProvider?.currentTheme.primaryColor ?? .black))
	}
}
let themeProvider = ThemeProvider()
PlaygroundPage.current.setLiveView(
	ThemedView()
	/// Inject the theme provider into `ThemedView`'s environment.
		.environment(themeProvider)
		.frame(width: 390, height: 844)
)
//: [Next](@next)
