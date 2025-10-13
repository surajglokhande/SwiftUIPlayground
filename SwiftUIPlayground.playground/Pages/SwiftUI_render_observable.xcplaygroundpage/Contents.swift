//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

@Observable
class TaskViewModel {
    var tasks: [String] = []
    var count: Int = 5
    
    func addTask(_ task: String) {
        // When this property changes, any view observing this object will update
        tasks.append(task)
    }
}

struct TaskListView: View {
    @Bindable var viewModel: TaskViewModel
    
    var body: some View {
        
        let _ = Self._printChanges()
        
        VStack {
            TextViewOne()
            
            TextViewTwo(count: $viewModel.count)
            
            List(viewModel.tasks, id: \.self) { task in
                Text(task)
            }
            
            ButtonView(viewModel: viewModel)
        }
    }
}

struct ButtonView: View {
    
    @State var viewModel: TaskViewModel
    var body: some View {
        let _ = Self._printChanges()
        Button("Add Task") {
            viewModel.addTask("New Task \(viewModel.tasks.count + 1)")
            viewModel.count += 1
        }
        .foregroundStyle(.debug)
    }
}

struct TextViewOne: View {
    
    var body: some View {
        let _ = Self._printChanges()
        Text("Count: 5")
            .foregroundColor(.debug)
    }
}

struct TextViewTwo: View {
    
    @Binding var count: Int
    
    var body: some View {
        let _ = Self._printChanges()
        Text("Count: \(count)")
            .foregroundColor(.debug)
    }
}

struct ContentView: View {
    @State var viewModel = TaskViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        TaskListView(viewModel: viewModel)
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
    ContentView()
        .frame(width: 390, height: 500)
)

//: [Next](@next)
