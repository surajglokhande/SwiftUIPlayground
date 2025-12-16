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

PlaygroundPage.current.setLiveView(
    SwiftUI_combine_passThroughtSubject()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
