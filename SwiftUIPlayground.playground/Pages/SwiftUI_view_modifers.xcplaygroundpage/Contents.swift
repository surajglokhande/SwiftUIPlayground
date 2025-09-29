//: [Previous](@previous)
import Foundation
import SwiftUI
import PlaygroundSupport

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
            .font(.title)
            .fontWeight(.bold)
            .background(.blue)
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
