//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_geometry_Reader: View {
    
    @State var slider_start_x = 0.0
    @State var slider_start_y = 0.0
    @State var slider_end_x = 0.0
    @State var slider_end_y = 0.0
    
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                print(geometry.size)
                                // Use position to create custom drag behavior
                            }
                    )
            }
        }
        .padding(50)
        .backgroundStyle(.red)
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_geometry_Reader()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
