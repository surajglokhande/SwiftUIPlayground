//: [Previous](@previous)
/*:
 
 ## ResultBuilder
 - a result builder is a general language feature that allows the creation of a custom domain-specific language (DSL), while a ViewBuilder is a specific, built-in implementation of a result builder provided by SwiftUI for declaratively constructing user interfaces.
 - Transforms a Sequence into a Single Result: It takes a series of expressions (each line inside the closure) and combines them into a single, cohesive return value.
 
 ## ViewBuilder
 - A custom parameter attribute that constructs views from closures.
 - You only need to explicitly write @ViewBuilder when creating custom view properties that accept multiple views:
 */
import Foundation
import SwiftUI
import PlaygroundSupport
struct SwiftUI_view_builder<Content: View>: View {
    @State private var isLogin:Bool = false
    let content: Content
    
    @ViewBuilder // Applied to the computed property (getter)
    var someViews: some View {
        Text("View One")
        Text("This is a View Builder by computed property")
    }
    
    init(@ViewBuilder content: () -> Content) { // Applied to the initializer parameter
        self.content = content()
    }
    
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
        content
        Spacer()
        someViews
        Spacer()
        createViewUsingViewBuilderOne()
        Spacer()
        createViewUsingViewBuilderTwo()
        Spacer()
        bottomFooterView(name: "Footer") {
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
            Text(name)
            content()
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_view_builder(content: {
        Text("through initilizer")
    })
        .frame(width: 390, height: 844)
)


//: [Next](@next)
