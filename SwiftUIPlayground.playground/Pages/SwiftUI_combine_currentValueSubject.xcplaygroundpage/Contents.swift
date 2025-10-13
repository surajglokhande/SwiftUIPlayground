//: [Previous](@previous)
/*:
 **Key Features:**
 
 - **Holds a Current Value:** Always stores its latest value (unlike PassthroughSubject, which does not keep state).
 - **Initial Value Required:** You must provide an initial value when creating it.
 - **Publishes Immediately:** When a subscriber attaches, it immediately receives the current value, followed by any future values.
 
 **How Does It Work?**
 
 - You can send new values to it using .send(_:).
 - You can subscribe to it, and subscribers will always get the latest value first
 */
import Foundation
import SwiftUI
import Combine
import PlaygroundSupport

class CounterViewModel: ObservableObject {
    // @Published var count: Int = 0
    var count: CurrentValueSubject<Int, Never> = .init(0)
    
    var tasks: CurrentValueSubject<[String], Never> = .init([])
    
    func addTask(_ task: String) {
        // When this property changes, any view observing this object will update
        tasks.send(tasks.value + [task])
    }
}

struct SwiftUI_combine_currentValueSubject: View {
    @ObservedObject private var viewModel = CounterViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            TextView()
            TextViewAnother()
            ListView()
            CounterView()
        }
        .environmentObject(viewModel)
    }
}

struct ListView: View {
    @EnvironmentObject var viewModel: CounterViewModel
    @State private var array: [String] = []
    var body: some View {
        List(array, id: \.self) { task in
            Text(task)
        }
        .onReceive(viewModel.tasks) { tasks in
            array = tasks
        }
    }
}

struct TextViewAnother: View {
    var body: some View {
        Text("Count: 5")
            .foregroundStyle(.debug)
    }
}

struct TextView: View {
    @EnvironmentObject var viewModel: CounterViewModel
    @State private var text: Int = 0
    var body: some View {
        let _ = Self._printChanges()
        // Text("Count: \(viewModel.count)") //Old
        Text("Count: \(text)")
            .onReceive(viewModel.count, perform: { value in
                text = value
            })
            .foregroundStyle(.debug)
    }
}
struct CounterView: View {
    @EnvironmentObject var viewModel: CounterViewModel
    var body: some View {
        let _ = Self._printChanges()
        Button("Increment") {
            // viewModel.count += 1 // Old
            viewModel.count.send(viewModel.count.value + 1)
            viewModel.addTask("New Task \(viewModel.tasks.value.count + 1)")
        }
        .foregroundStyle(.debug)
    }
}
extension ShapeStyle where Self == Color {
    static var debug: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
PlaygroundPage.current.setLiveView(
    SwiftUI_combine_currentValueSubject()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
