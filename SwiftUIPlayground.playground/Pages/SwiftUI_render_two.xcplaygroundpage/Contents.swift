//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

// 1. Create a model that conforms to ObservableObject
class TaskViewModel: ObservableObject {
    // @Published tells SwiftUI which properties should trigger updates
    @Published var tasks: [String] = []
    @Published var count: Int = 5
    
    func addTask(_ task: String) {
        // When this property changes, any view observing this object will update
        tasks.append(task)
    }
}


// 2. Create a view that uses the model with @ObservedObject
struct TaskListView: View {
    // This view will update whenever published properties in viewModel change
    @StateObject var viewModel: TaskViewModel
    
    var body: some View {
        
        let _ = Self._printChanges()
        
        VStack {
            Text("Count: 5")
                .border(.debug)
            List(viewModel.tasks, id: \.self) { task in
                
                Text(task)
            }
            
            Button("Add Task") {
                viewModel.addTask("New Task \(viewModel.tasks.count + 1)")
//                viewModel.count += 1
            }
        }
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

// 3. Create a parent view that passes the viewModel
struct ContentView: View {
    // The parent view creates and owns the viewModel
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        // Pass the viewModel to child views
        let _ = Self._printChanges()
        
        TaskListView(viewModel: viewModel)
    }
}

PlaygroundPage.current.setLiveView(
    ContentView()
        .frame(width: 390, height: 500)
)

//: [Next](@next)
