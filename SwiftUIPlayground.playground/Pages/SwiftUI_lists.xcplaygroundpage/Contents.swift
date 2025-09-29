//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct SwiftUI_lists: View {

    @State var selectionOne: Int? = nil
    @State var selectionTwo: Set<Int> = []
    @State var expandWorkDays: Bool = true

    var body: some View {

        Group {
                //list
            List() {
                Section(content: {
                    ForEach(0..<3) { _ in
                        Text("Single Selection!")

                    }
                }, header: {
                    Text("Header")
                }, footer: {
                    Text("Footer")
                })
            }.listStyle(GroupedListStyle())

                //single selection
            Button("Toggle Below List") { expandWorkDays = !expandWorkDays }
            List(selection: $selectionOne) {
                Section("Suraj", isExpanded: $expandWorkDays) {
                    ForEach(0..<3) { _ in
                        Text("Single Selection!")
                    }
                }
            }

                //multiple selection
            List(selection: $selectionTwo) {
                EditButton()
                    //.frame(maxWidth: .infinity, alignment: .center)

                ForEach(0..<3) { _ in
                    Text("Multiple Selection!")
                }
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_lists()
        .frame(width: 390, height: 844)
        .border(.white)
)

//: [Next](@next)
