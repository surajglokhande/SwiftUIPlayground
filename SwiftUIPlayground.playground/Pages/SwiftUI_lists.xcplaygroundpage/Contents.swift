//: [Previous](@previous)
/*:
 The Identifiable protocol in Swift is a simple protocol used to uniquely identify objects, especially when you work with collections in SwiftUI. It’s crucial for views like List, ForEach, and other places where SwiftUI needs to efficiently track, update, and animate items in a collection.

 **What Does Identifiable Do?**

 - It requires conforming types to have a unique id property.
 - The id must be unique among all items in the collection.
 - SwiftUI uses the id to differentiate, update, and animate individual views when the data changes.
 
 **Protocol Definition**

 protocol Identifiable {
     associatedtype ID: Hashable
     var id: ID { get }
 }
 ID can be any type that conforms to Hashable, commonly UUID, Int, or String.
 */
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
            Text("Selected:\(selectionOne ?? 0)")
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

struct Contact: Identifiable {
    let id = UUID()
    let name: String
}

struct SwiftUI_dynamic_lists: View {
    
    var listItems: [String] = ["Apple", "Banana", "Orange", "Mango", "Pineapple"]
    var listOfContacts: [Contact] = [
        .init(name: "Alice"),
        .init(name: "Bob"),
        .init(name: "Charlie"),
    ]
    
    var body: some View {
        List(listOfContacts) { contact in
            Text(contact.name)
        }
        List(listItems, id: \.self) { count in
            Text(count)
        }
    }
}

PlaygroundPage.current.setLiveView(
//    SwiftUI_lists()
//        .frame(width: 390, height: 844)
//        .border(.white)
    SwiftUI_dynamic_lists()
        .frame(width: 390, height: 844)
        .border(.white)
)

//: [Next](@next)
