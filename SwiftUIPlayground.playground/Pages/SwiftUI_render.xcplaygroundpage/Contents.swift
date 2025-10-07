//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct ParentView: View {
    @State private var counter = 0
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("Parent Counter: \(counter)")
            Button("Increment") {
                counter += 1
            }
            
            // Child view 1 - Will re-render when counter changes
            ChildViewWithDependency(value: counter)
            
            // Child view 2 - Will NOT re-render when counter changes
            ChildViewWithoutDependency()
            
            // Child view 3 - Will re-render only if identity changes
            if counter % 2 == 0 {
                EvenCounterView()
            } else {
                OddCounterView()
            }
        }
    }
}

struct ChildViewWithDependency: View {
    let value: Int
    
    var body: some View {
        let _ = Self._printChanges()
        Text("Child with dependency: \(value)")
            .background(Color.yellow)
//            .onAppear { print("ChildViewWithDependency rendered") }
    }
}

struct ChildViewWithoutDependency: View {
    var body: some View {
        let _ = Self._printChanges()
        Text("Child without dependency")
            .background(Color.green)
//            .onAppear { print("ChildViewWithoutDependency rendered") }
    }
}

struct EvenCounterView: View {
    var body: some View {
        let _ = Self._printChanges()
        Text("Counter is even")
            .background(Color.blue)
//            .onAppear { print("EvenCounterView rendered") }
    }
}

struct OddCounterView: View {
    var body: some View {
        let _ = Self._printChanges()
        Text("Counter is odd")
            .background(Color.red)
//            .onAppear { print("OddCounterView rendered") }
    }
}
PlaygroundPage.current.setLiveView(
    ParentView()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
