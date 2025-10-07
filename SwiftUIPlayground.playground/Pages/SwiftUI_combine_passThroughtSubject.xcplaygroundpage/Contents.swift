//: [Previous](@previous)
import Foundation
import SwiftUI
import Combine
import PlaygroundSupport

struct SwiftUI_combine_passThroughtSubject: View {
    var body: some View {
        let _ = Self._printChanges()
    }
}

extension ShapeStyle where Self == Color {
    static var debug: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
PlaygroundPage.current.setLiveView(
    SwiftUI_combine_passThroughtSubject()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
