//: [Previous](@previous)
/*:
 
 ## ResultBuilder
 - The @resultBuilder is a Swift language feature that acts like a "mini-compiler" or a special transformer, allowing you to create custom, highly readable syntax within a function or closure.
 - Transforms a Sequence into a Single Result: It takes a series of expressions (each line inside the closure) and combines them into a single, cohesive return value.
 
 ## ViewBuilder
 - A custom parameter attribute that constructs views from closures.
 - You only need to explicitly write @ViewBuilder when creating custom view properties that accept multiple views:
 */
import Foundation
import SwiftUI
import PlaygroundSupport
struct SwiftUI_view_builder: View {
    @State private var isLogin:Bool = false
    func createViewUsingViewBuilderTwo() -> some View {
        if isLogin {
            Text("This is a View Builder by func using @ViewBuilder property Wrapper")
                .multilineTextAlignment(.center)
        }else {
            Text("This is a View Builder by func using @ViewBuilder property Wrapper")
                .multilineTextAlignment(.center)
        }
    }
    var body: some View {
        Spacer()
        TopHeaderView(/*name: "header_view"*/) {
            Text("This is struct View and return content by callback")
                .multilineTextAlignment(.center)
        }
        Spacer()
        createViewUsingViewBuilderOne()
        Spacer()
        createViewUsingViewBuilderTwo()
        Spacer()
        bottomFooterView(name: "footer") {
            Text("This is extension View and return content by callback")
                .multilineTextAlignment(.center)
        }
        Spacer()
    }
}

struct TopHeaderView<Content: View>: View {
    //let name: String
    let content: () -> Content

    var body: some View {
        VStack{
            content()
        }
    }
}

extension View {
    @ViewBuilder //
    func createViewUsingViewBuilderOne() -> some View {
        Text("This is a View Builder by func using extension")
            .multilineTextAlignment(.center)
        Text("This is a View Builder by func using extension")
            .multilineTextAlignment(.center)
    }
}
extension View {
    func bottomFooterView<Content: View>(name: String, content: () -> Content) -> some View {
        VStack{
            content()
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_view_builder()
        .frame(width: 390, height: 844)
)


//: [Next](@next)
