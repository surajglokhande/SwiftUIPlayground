//: [Previous](@previous)
/*:
 - **Sibling Views:** zIndex primarily affects how views at the same level in the view hierarchy are layered. If you have multiple views inside a ZStack, VStack, or HStack, zIndex will determine which of those sibling views appears on top if they overlap.
 
 - **Parent Container:** The scope of zIndex is limited to the immediate parent container. A view's zIndex will not affect the layering of views in a different parent container.
 
    For example, if you have two ZStacks, the zIndex of a view inside the first ZStack will only be compared against other views within that same ZStack. It won't be compared against views in the second ZStack.
 
    To control the layering of the ZStacks themselves, you would apply zIndex to the ZStack views if they are siblings within a larger container.
 
 - **Default Behavior:** By default, views have a zIndex of 0. SwiftUI renders views in the order they appear in your code. So, the last view declared will typically appear on top if views overlap, assuming they all have the default zIndex.
 
 - **Higher Value, On Top:** A view with a higher zIndex value will be drawn on top of its siblings with lower zIndex values. Negative values are also supported.
 */
import SwiftUI
import PlaygroundSupport
struct SwiftUI_zIndex: View {
    var body: some View {
        ZStack {
            // View 3
            Rectangle()
                .fill(Color.green)
                .frame(width: 60, height: 60)
                .offset(x: 40, y: 40) // To make it overlap
                .zIndex(1) // zIndex is also 1
            // View 1
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .zIndex(1) // zIndex is 1

            // View 2
            Rectangle()
                .fill(Color.blue)
                .frame(width: 80, height: 80)
                .offset(x: 20, y: 20) // To make it overlap
                .zIndex(1) // zIndex is also 1


        }
    }
}
PlaygroundPage.current.setLiveView(
    SwiftUI_zIndex()
        .frame(width: 390, height: 844)
)
/*:
 - **Default zIndex:** If you don't explicitly set a zIndex, views default to a value of 0.

 - **Higher zIndex on Top:** Views with a higher zIndex value will always appear on top of views with lower zIndex values. This is the primary rule for zIndex behavior.

 - **Equal zIndex (Declaration Order):** When sibling views have the same zIndex value (including the default 0), SwiftUI falls back to the order in which those views are declared within their parent container. The view declared later in the code will appear on top of the views declared earlier.
 */
//: [Next](@next)
