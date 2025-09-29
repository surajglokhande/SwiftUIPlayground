//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct GridContentViews: View {
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]

    var body: some View {
        let rows = [
//            GridItem(.flexible(), alignment: .top),
//            GridItem(.fixed(70), alignment: .center),
            GridItem(.adaptive(minimum: 50), alignment: .center),
//            GridItem(.flexible(minimum: 50, maximum: 100), alignment: .bottom)
        ]

        let coloumn = [
            GridItem(.flexible()),GridItem(.flexible())]

        VStack{
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: VerticalAlignment.center) {
                    ForEach(0..<100) { idx in
                        RoundedRectangle(cornerRadius: 5)
                            .fill(colors[(idx/3)%7])
                            .frame(width: 30)
                            .overlay {
                                Text("🎱")
                                    //.foregroundStyle(.black)
                                    //.background(.white)
                            }

                    }
                }.background(.black)
            }

            ScrollView(.vertical) {
                LazyVGrid(columns: coloumn, alignment: HorizontalAlignment.center) {
                    ForEach(0..<100) { idx in
                        RoundedRectangle(cornerRadius: 5)
                            .fill(colors[(idx/3)%7])
                            .frame(height: 30)
                            .overlay {
                                Text("🎱")
                                    //.foregroundStyle(.black)
                                    //.background(.white)
                            }
                    }
                }.background(.black)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    GridContentViews()
        .frame(width: 390, height: 844)
)


//: [Next](@next)
