//: [Previous](@previous)
/*:
 ## @GestureState
 @GestureState stores values associated with a gesture that is currently in progress, such as how far you have swiped, except it will be reset to its default value when the gesture stops. This owns its data.
 SwiftUI gives us a specific property wrapper for tracking the state of gestures, helpfully called @GestureState. Although you can accomplish the same using a simple @State property wrapper, @GestureState comes with the added ability that it automatically sets your property back to its initial value when the gesture ends, and it’s usually significantly faster than using a simple @State as well.
 */
import SwiftUI
import PlaygroundSupport
struct GestureView: View {

	@GestureState private var gestureDrag: CGSize = .zero

	var body: some View {
		let gestureDrag = DragGesture().updating($gestureDrag) { value, state, transaction in
			debugPrint("value: \(value.location)")
				//debugPrint("state: \(state)")
				//debugPrint("transaction: \(transaction.)")
		}
		RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
			.frame(width: 300, height: 300)
			.gesture(gestureDrag)
	}
}
PlaygroundPage.current.setLiveView(
	GestureView()
		.frame(width: 390, height: 844)
)
//: [Next](@next)
