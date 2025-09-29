//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
	var body: some View {
        VStack(spacing: 100) {
            Text("hello World!")
                .foregroundStyle(.green)
                .background(.black)
                .padding(20)
                
        }
    }

}
PlaygroundPage.current.setLiveView(
    ContentView()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
