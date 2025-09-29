//: [Previous](@previous)
/*:
 ## ObservedObject
 > @ObservedObject refers to an instance of an external class that conforms to the ObservableObject protocol. This does not own its data.
 SwiftUI gives us the @ObservedObject property wrapper so that views can watch the state of an external object, and be notified when something important has changed. It is similar in behavior to @StateObject, except it must not be used to create objects – use @ObservedObject only with objects that have been created elsewhere, otherwise SwiftUI might accidentally destroy the object.

 First, any type you mark with @ObservedObject must conform to the ObservableObject protocol, which in turn means it must be a class rather than a struct. This isn’t optional – SwiftUI requires us to use a class here.

 Second, observed objects are specifically designed for data that is external to your view, which means it might be shared across more than one view. The @ObservedObject property wrapper will automatically make sure the property is watched closely so that important changes will reload any views using it. This also means the data must be created elsewhere, then sent in to your view.

 Third, not all properties in an observed object cause views to refresh – you need to decide which properties should send change notifications, either using @Published or custom announcements. Types that conform to ObservableObject are given a default objectWillChange publisher to make custom announcements as needed.
 */
/*:
 Example One
 */
import SwiftUI
import PlaygroundSupport
class UserProgress: ObservableObject {
	@Published var score = 0
}

struct InnerView: View {
	@ObservedObject var progress: UserProgress

	var body: some View {
		Button("Increase Score") {
			progress.score += 1
		}
	}
}

struct ContentView: View {
	@StateObject var progress = UserProgress()

	var body: some View {
		VStack {
			Text("Your score is \(progress.score)")
			InnerView(progress: progress)
		}
	}
}
PlaygroundPage.current.setLiveView(
	ContentView()
		.frame(width: 390, height: 844)
)
/*:
 Example Two
 */
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
struct ObservedObjectCounterViewTwo: View {
	@ObservedObject var viewModel: CounterViewModel

	var body: some View {
		VStack {
			Text("ObservedObjectCounterView Count is: \(viewModel.count)")
			Button("ObservedObjectCounterView Increment Counter") {
				viewModel.incrementCounter()
			}
		}.background(.gray)
	}
}
struct StateObjectCounterViewTwo: View {
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
struct RandomNumberViewTwo: View {
	@State var randomNumber = 0
	@StateObject var viewModel = CounterViewModel(_name: "ObservedObjectCounterView")
	var body: some View {
		VStack {
			Text("Random number is: \(randomNumber)")
			Button("Generate Random Number") {
				randomNumber = (0..<1000).randomElement()!
			}
			StateObjectCounterViewTwo()
			ObservedObjectCounterViewTwo(viewModel: viewModel)
		}.padding(.bottom)
			// Here, CounterView includes an @ObservedObject.

	}
}
PlaygroundPage.current.setLiveView(
	RandomNumberViewTwo()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
