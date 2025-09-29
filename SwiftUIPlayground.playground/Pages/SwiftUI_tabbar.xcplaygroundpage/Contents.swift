//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct SwiftUI_tabbar: View {
    var body: some View {
        TabView {
            Text("Home Tab")
                .tabItem {
                    HStack {
                        Image(systemName: "house")
                    }
                }

            Text("Search Tab")
                .tabItem {
                    HStack {
                        Image(systemName: "search")
                    }
                }
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_tabbar()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
