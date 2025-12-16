//: [Previous](@previous)
/*:
 - @State value → @Binding value ✅
 - @StateObject property → @Binding property ✅
 - @StateObject → @Bindable ✅ (iOS 17+)
 - @StateObject → @Binding ❌ (doesn't work)
 
 👉 @Binding is for binding between Views.
 
 👉 @Bindable is for binding between UI and ViewModel properties.
 */
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
            
            ListView(viewModel: viewModel)
            
            ButtonView(viewModel: viewModel)
        }
    }
}

struct ListView: View {
    @Bindable var viewModel: TaskViewModel
    var body: some View {
        List(viewModel.tasks, id: \.self) { task in
            Text(task)
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

PlaygroundPage.current.setLiveView(
    ContentView()
        .frame(width: 390, height: 500)
)

//: [Next](@next)
