//: [Previous](@previous)

import PlaygroundSupport
import SwiftUI

struct CustomNavigationBar: View {
    var title: String
    var isBackButtonHidden: Bool = false
    var callback: (() -> Void)?
    var body: some View {
        HStack {
            if !isBackButtonHidden {
                Button(action: {
                    // Action for back button
                    callback?()
                }) {
                    Image(systemName: "arrow.left")
                }
            }
            Spacer()
            Text(title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
    }
}

struct ContentView: View {
    
    @Binding var path: NavigationPath
    var body: some View {
        
        VStack {
            CustomNavigationBar(title: "Home", isBackButtonHidden: true)
            Spacer()
            Button("Go to Detail View") {
                path.append("DetailView")
            }
            Spacer()
                .navigationDestination(for: String.self) { value in
                    if value == "DetailView" {
                        DetailView(path: $path)
                    }
                }
        }
        .navigationTitle(Text("NavigationTitle"))
    }
}

struct DetailView: View {
    @Binding var path: NavigationPath

    var body: some View {
        VStack {
            CustomNavigationBar(title: "Detail") {
                path.removeLast()
            }
            Spacer()
            Button("Back to Home View") {
                path.removeLast()
            }
            Spacer()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}
struct AnonatherView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            ContentView(path: $path)
        }
    }
}
PlaygroundPage.current.setLiveView(
    AnonatherView()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
