//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport
/*:
 ## AppStorage
 > @AppStorage reads and writes values from UserDefaults. This owns its data.

 SwiftUI has a dedicated property wrapper for reading values from UserDefaults, which will automatically reinvoke your view’s body property when the value changes. That is, this wrapper effectively watches a key in UserDefaults, and will refresh your UI if that key changes.
 */
struct AppStorageContentView: View {
	@AppStorage("username") var username : String?
		//@AppStorage("username", store: UserDefaults(suiteName: "com.suraj.swituidemos")) var username : String?
	@State var flag: Bool = true

	var body: some View {
		VStack(content: {
			Text("Hello, \(username ?? "value not set yet!")")
			Button(action: {
				username = flag ? "shweta96tm" : "suraj96tm"
				flag.toggle()
			}, label: {
				Text("Click me!")
			})
			if let text = username {
				Text("changed userdefault value: \(text)")
			}
			/*
			 internally used userdefault
			 */
		})
	}
}
PlaygroundPage.current.setLiveView(
	AppStorageContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
