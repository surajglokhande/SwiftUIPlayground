//: [Previous](@previous)
/*:
 ## StateObject vs ObservedObject
 Using @ObservedObject causes the @Published variable to reset whenever @State changes.

 You’ll notice that using @ObservedObject inside the CounterView causes the @Published variable, the counter, to reset every time a new random number is generated.
 
 **Conclusion**
 
 @StateObject and @ObservedObject have similar features, but they differ in how SwiftUI manages their lifecycle. Use the state object property wrapper to ensure consistent results when the current view creates the observed object. Use @ObservedObject when injecting an observed object as a dependency.

 */
import SwiftUI
import PlaygroundSupport
final class CounterViewModel: ObservableObject {
	@Published var count = 0
	var name: String = ""
	init(_name: String) {
		self.name = _name
		debugPrint("\(self) init \(name)")
	}

	func incrementCounter() {
		count += 1
	}

	deinit {
		debugPrint("\(self) de-init \(name)")
	}
}
struct ObservedObjectCounterView: View {
	@ObservedObject var viewModel = CounterViewModel(_name: "ObservedObjectCounterView")

	var body: some View {
		VStack {
			Text("ObservedObjectCounterView Count is: \(viewModel.count)")
			Button("ObservedObjectCounterView Increment Counter") {
				viewModel.incrementCounter()
			}
		}.background(.gray)
	}
}
struct StateObjectCounterView: View {
	@StateObject var viewModel = CounterViewModel(_name: "StateObjectCounterView")

	var body: some View {
		VStack {
			Text("StateObjectCounterView Count is: \(viewModel.count)")
			Button("StateObjectCounterView Increment Counter") {
				viewModel.incrementCounter()
			}
		}.background(.cyan)
	}
}
struct RandomNumberView: View {
	@State var randomNumber = 0
	var body: some View {
		VStack {
			Text("Random number is: \(randomNumber)")
			Button("Generate Random Number") {
				randomNumber = (0..<1000).randomElement()!
			}
			StateObjectCounterView()
			ObservedObjectCounterView()
		}.padding(.bottom)
			// Here, CounterView includes an @ObservedObject.

	}
}
PlaygroundPage.current.setLiveView(
	RandomNumberView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
