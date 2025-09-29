//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_background_overlays: View {
    var body: some View {
        VStack(spacing: 100) {
            Text("SwiftUI_background")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundStyle(.green)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 100)
                .background(.blue, in: .circle)


            Circle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 0, y: 3)
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .fill(.blue)
                        .frame(width: 30, height: 30)
                        .overlay(content: {
                            Text("2")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        })
                }
        }
    }
}


PlaygroundPage.current.setLiveView(
    SwiftUI_background_overlays()
        .frame(width: 390, height: 844)
)



//: [Next](@next)
