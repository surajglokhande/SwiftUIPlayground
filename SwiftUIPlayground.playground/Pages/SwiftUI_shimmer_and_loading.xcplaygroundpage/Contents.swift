//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_shimmer_and_loading: View {

    @State var slider_start_x = 0.0
    @State var slider_start_y = 0.0
    @State var slider_end_x = 0.0
    @State var slider_end_y = 0.0


    var body: some View {
        VStack {
            LinearGradient(colors: [.gray, .white, .gray], startPoint: UnitPoint(x: slider_start_x, y: slider_start_y), endPoint: UnitPoint(x: slider_end_x, y: slider_end_y))
                .frame(width: 300, height: 300)
//                .onAppear {
//                    withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
//                        startPoint = UnitPoint(x: slider_start_x, y: slider_start_y)
//                        endPoint = UnitPoint(x: slider_end_x, y: slider_end_y)
//                    }
//                }

            Slider(value: $slider_start_x, in: 0...1)
            Text("slider for start x")
            Slider(value: $slider_start_y, in: 0...1)
            Text("slider for start y")
            Slider(value: $slider_end_x, in: 0...1)
            Text("slider for end x")
            Slider(value: $slider_end_y, in: 0...1)
            Text("slider for end y")

        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_shimmer_and_loading()
        .frame(width: 390, height: 844)
)

//: [Next](@next)
