//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

class MyDataManager {
    static let shared = MyDataManager()
    
    private init() {}
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return data.randomElement()
    }
}

struct SwiftUI_swift_concurrency_actor: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill", content: {
                HomeView()
            })
            Tab("Profile", systemImage: "magnifyingglass", content: {
                ProfileView()
            })
        }
    }
}

struct HomeView: View {
    let manager = MyDataManager.shared
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(1)
            Text("\(text)")
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .background).async {
            print("inside home")
                if let data = manager.getRandomData() {
                    DispatchQueue.main.async {
                        text = data
                    }
                }
            }
        }
    }
}

struct ProfileView: View {
    
    let manager = MyDataManager.shared
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.red.opacity(1)
            Text("\(text)")
        }
        .onReceive(timer) { _ in
            DispatchQueue.global(qos: .default).async {
            print("inside profile")
                if let data = manager.getRandomData() {
                    DispatchQueue.main.async {
                        text = data
                    }
                }
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_swift_concurrency_actor()
        .frame(width: 390, height: 800)
)
//: [Next](@next)
