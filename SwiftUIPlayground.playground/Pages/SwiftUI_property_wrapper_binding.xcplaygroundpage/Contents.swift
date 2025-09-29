//: [Previous](@previous)
/*:
 ## Binding
 > @Binding refers to value type data owned by a different view. Changing the binding locally changes the remote data too. This does not own its data.

 @Binding lets us declare that one value actually comes from elsewhere, and should be shared in both places. This is not the same as @ObservedObject or @EnvironmentObject, both of which are designed for reference types to be shared across potentially many views.
 */
import SwiftUI
import PlaygroundSupport
struct BindingContentView: View {

	@State private var showingAddUser = false

	var body: some View {
		VStack {
			Text("demo of binding")
			Button(action: {
				debugPrint("before: \(showingAddUser)")
				showingAddUser.toggle()
				debugPrint("after: \(showingAddUser)")
			}, label: {
				Text("Click me!")
			}).sheet(isPresented: $showingAddUser) {
				AddView(isPresented: $showingAddUser)
			}
		}

	}
}
extension BindingContentView {
	struct AddView: View {
		@Binding var isPresented: Bool

		var body: some View {
			Button("Dismiss") {
				debugPrint("inside before: \(isPresented)")
				isPresented.toggle()
				debugPrint("inside after: \(isPresented)")
			}
		}
	}
}

PlaygroundPage.current.setLiveView(
	BindingContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
