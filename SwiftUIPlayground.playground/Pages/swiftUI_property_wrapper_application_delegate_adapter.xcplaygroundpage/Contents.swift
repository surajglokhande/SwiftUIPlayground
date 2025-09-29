//: [Previous](@previous)
/*:
 ## @UIApplicationDelegateAdaptor
 @UIApplicationDelegateAdaptor is a property wrapper introduced in iOS 14 and macOS 11 that allows you to provide a custom UIApplicationDelegate for your SwiftUI app. This property wrapper simplifies the integration of UIKit's UIApplicationDelegate with SwiftUI apps.
 */
import SwiftUI
import PlaygroundSupport
struct DelegateContentView: View {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	var body: some View {
		Text("Hello World!")
	}
}
class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		print("Application did finish launching")
		return true
	}

	func applicationWillTerminate(_ application: UIApplication) {
		print("Application will terminate")
	}
	func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		print("Application will finish launching")
		return true
	}
}
PlaygroundPage.current.setLiveView(
	DelegateContentView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
