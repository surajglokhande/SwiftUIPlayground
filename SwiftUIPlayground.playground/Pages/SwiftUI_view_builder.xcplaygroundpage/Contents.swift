//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import SwiftUI
/*:
 # ViewBuilder
 ## A custom parameter attribute that constructs views from closures.
 */

struct SwiftUI_view_builder: View {
    var body: some View {
        TopHeaderView(name: "header_view") {
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

    }
}

struct TopHeaderView<Content: View>: View {
    let name: String
    let content: () -> Content

    var body: some View {
        VStack{
            content()
        }
    }
}

extension View {
    func createViewUsingViewBuilderOne() -> some View {
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
