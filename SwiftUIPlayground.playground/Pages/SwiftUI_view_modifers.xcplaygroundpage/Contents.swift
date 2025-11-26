//: [Previous](@previous)
import Foundation
import SwiftUI
import PlaygroundSupport
/*:
 ## Modifier
 - A modifier is essentially a function that conforms to the ViewModifier protocol and takes an original view as input, applies some transformation, and returns a new view.
    - **Non-Mutating:** Modifiers in SwiftUI do not change the original view. Instead, they wrap the original view in a new view (often an internal type like _ModifiedContent) that incorporates the desired changes. This is a core concept of SwiftUI's immutable, value-type nature.
    - **Chaining:** Because every modifier returns a new view, you can chain multiple modifiers together on a single line, applying changes sequentially. The order of these modifiers is often very important.

 - 🧱 The View Wrapping Process
    - The core concept is View Wrapping or Composition. Every time you apply a modifier, you are creating a new, specialized view that contains the previous view.

    - **1. The Original View Becomes Content**
        Let's start with a simple view:

        let originalView = Text("Hello") // ⬅️ The "old value"
        When you apply the first modifier, say .padding():

        let modifiedView = originalView.padding()
 
        - The padding() modifier doesn't change originalView. Instead, it returns a new view—internally often called _ModifiedContent or something similar—which has two key properties:

        - The original view (Text("Hello")) is stored as the content or body of the new view.

        - The modifier (_PaddingLayout) is stored as the modifier of the new view.

        - So, the "old value" (Text("Hello")) is now structurally nested inside the modifiedView. It's still there, pristine and unchanged.
 
    - **2. Building the View Chain**
        - If you chain another modifier, like .background(.blue), the process repeats:

            let finalView = modifiedView.background(.blue)
 
        - The background(.blue) modifier creates a third view that wraps the second view (modifiedView), which, in turn, wraps the first view (originalView).

        - The final view you place in your body is actually a deep stack of nested views, with the original Text at the very bottom.
 */
struct SwiftUI_view_modifers: View {
    var body: some View {
        /*
         custom ViewModifier using struct
         */
        Spacer(minLength: 600)
        Text("custom ViewModifier using struct")
            .modifier(Title())
        Spacer()
        /*
         custom ViewModifier using extension view func
         */
        Text("custom ViewModifier using extension view func")
            .titleStyle()
        Spacer()
    }
}


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.padding(20)
            .font(.title)
            .fontWeight(.bold)
            .background(.blue)
            .padding(20)
            .background(.red)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func titleStyle() -> some View {
        /*
         call custom ViewModifier made by struct
         */
        modifier(Title())
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_view_modifers()
        .frame(width: 390, height: 844)
)

//: [Next](@next)
