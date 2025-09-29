//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_scrollview: View {
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(1..<10) {_ in
                    ScrollView([.horizontal], showsIndicators: false) {
                        HStack{
                            ForEach(1..<10) {_ in
                                Text("Hello world")
                                    .foregroundStyle(.white)
                                    .padding(80)
                                    .background(.blue)
                                    .cornerRadius(10)
                                    .shadow(color: .black, radius: 5, x: 0, y: 0)
                                    .padding(10)
                            }
                        }
                    }
                    .padding(5)
                }
            }
        }
    }
}



PlaygroundPage.current.setLiveView(
    SwiftUI_scrollview()
        .frame(width: 390, height: 844)
)


//: [Next](@next)
