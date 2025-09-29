//: [Previous](@previous)
/*:
 ## @Namespace
 @Namespace is a property wrapper provided by SwiftUI that allows you to synchronize the namespace of matched views for use in animations. It’s commonly used in conjunction with matchedGeometryEffect to create smooth transitions between views when their positions or sizes change.
 */
import SwiftUI
import PlaygroundSupport
struct NamespaceContentView: View {
	@State private var isFlipped = false
	@Namespace private var namespace

	var body: some View {
		VStack {
			if isFlipped {
				Circle()
					.fill(Color.blue)
					.frame(width: 100, height: 100)
					.matchedGeometryEffect(id: "circle", in: namespace)
			} else {
				RoundedRectangle(cornerRadius: 10)
					.fill(Color.red)
					.frame(width: 200, height: 200)
					.matchedGeometryEffect(id: "rectangle", in: namespace)
			}
		}
		.onTapGesture {
			withAnimation {
				isFlipped.toggle()
			}
		}
	}
}
PlaygroundPage.current.setLiveView(
	NamespaceContentView()
		.frame(width: 390, height: 844)
)

//: [Next](@next)
