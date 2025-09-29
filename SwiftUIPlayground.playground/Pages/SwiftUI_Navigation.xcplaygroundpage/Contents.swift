//: [Previous](@previous)
import Foundation
import PlaygroundSupport
import SwiftUI

struct User: Hashable {
    var name: String
}

//old
struct Navigation_view: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                SecoundView(user: User(name: "Dhiraj"))
            } label: {
                Text("Go to next View")
            }
        }
    }
}

//new
struct Navigation_stack: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go to Next Screen", value: User(name: "Dhiraj"))
        }
        .navigationDestination(for: User.self) { user in
            SecoundView(user: user)
        }
    }
}

struct SecoundView: View {
    var user: User
    
    var body: some View {
        Text("\(user.name)")
    }
}

PlaygroundPage.current.setLiveView(
    Navigation_stack()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
