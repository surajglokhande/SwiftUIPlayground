//: [Previous](@previous)
/*:
 ## StateObject
 > @StateObject is used to store new instances of reference type data that conforms to the ObservableObject protocol. This owns its data.

 SwiftUI’s @StateObject property wrapper is designed to fill a very specific gap in state management: when you need to create a reference type inside one of your views and make sure it stays alive for use in that view and others you share it with.

 If you want to use that inside various views, you either need to create it externally to SwiftUI and inject it in, or create it inside one of your SwiftUI views and use @StateObject

 **Important**: You should use @StateObject only once per object, which should be in whichever view is responsible for creating the object. All other views that share your object should use @ObservedObject.
 */
import SwiftUI
import PlaygroundSupport
class User: ObservableObject {
	@Published var username = "suraj96tm" // if not write @Publish username will not changed on click me!
}
struct StateObjectContentView: View {
	@StateObject var user = User()

	var body: some View {
		Text("Username: \(user.username)")
		Button {
			user.username = "shweta96tm"
		} label: {
			Text("Click me!")
		}
        SecoundView(newObj: user)
	}
}
struct SecoundView: View {
    @ObservedObject var newObj: User
    var body: some View {
        Text("\(newObj.username)")
    }
}
PlaygroundPage.current.setLiveView(
	StateObjectContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
