//: [Previous](@previous)
/*:
 ## State
 > @State lets us manipulate small amounts of value type data locally to a view. This owns its data.

 SwiftUI uses the @State property wrapper to allow us to modify values inside a struct, which would normally not be allowed because structs are value types.

 When we put @State before a property, we effectively move its storage out from our struct and into shared storage managed by SwiftUI. This means SwiftUI can destroy and recreate our struct whenever needed (and this can happen a lot!), without losing the state it was storing.

 @State should be used with simple struct types such as String, Int, and arrays, and generally shouldn’t be shared with other views. If you want to share values across views, you should probably use @ObservedObject or @EnvironmentObject instead – both of those will ensure that all views will be refreshed when the data changes.

 To re-enforce the local nature of @State properties, Apple recommends you mark them as private, like this:

 @State private var username = ""
 This isn’t required, but it seems like smart practice.

 Tip: You can use @State to track reference types if you want, you just won’t be notified when they change. This is particularly helpful for classes that don’t conform to the ObservableObject protocol.
 */
import SwiftUI
import PlaygroundSupport
struct StateContentView: View {
	@State private var username: String? = "Suraj"

	var body: some View {
		VStack {
			Text("My name is: \(username ?? "")")
			Button {
				username = "Dhiraj, After click"
			} label: {
				Text("Click me!")
			}
		}
	}
}
PlaygroundPage.current.setLiveView(
	StateContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
