//: [Previous](@previous)
/*:
 - **ObservableObject**: is a protocol for reference types (typically classes) that lets them broadcast change notifications to SwiftUI views. You conform to the ObservableObject protocol to allow your object to act as a data model that can be observed by one or more views. Typically, you use the @Published property wrapper on properties inside your ObservableObject to automatically send change notifications when these properties are updated.
 
 - **@ObservedObject**: is a property wrapper you use inside a SwiftUI view. It marks a property that is an instance of an ObservableObject. When you use @ObservedObject, SwiftUI monitors the wrapped object for change notifications and automatically refreshes the view whenever an observed property marked with @Published changes. This means your view stays in sync with the data inside the ObservableObject.
 
 **The Observation Mechanism**
 
 When you use @ObservedObject in a SwiftUI view, SwiftUI establishes a subscription to the objectWillChange publisher of your ObservableObject. This subscription is what enables the automatic view updates.
 
 **Here's the observation flow:**
 
 - You create a class that conforms to ObservableObject
 - You mark properties with @Published that should trigger updates
 - When a @Published property changes, it automatically calls objectWillChange.send()
 - Any view with an @ObservedObject referencing that instance receives the change notification
 - SwiftUI then re-evaluates the view's body property to reflect the updated state
 
 
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
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        
        let _ = Self._printChanges()
        
        VStack {
            TextViewOne()
            
            //binding resolved re-render issue by ObservedObject
            TextViewTwo(count: $viewModel.count)
            
            ListView(viewModel: viewModel)

            ButtonView()
                .environmentObject(viewModel)
        }
    }
}

struct ListView: View {
    @ObservedObject var viewModel: TaskViewModel
    var body: some View {
        List(viewModel.tasks, id: \.self) { task in
            Text(task)
        }
    }
}

struct ButtonView: View {
    @EnvironmentObject var viewModel: TaskViewModel
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
            .foregroundStyle(.debug)
    }
}

struct TextViewTwo: View {
    
    @Binding var count: Int
    
    var body: some View {
        let _ = Self._printChanges()
        Text("Count: \(count)")
            .foregroundStyle(.debug)
    }
}

// 3. Create a parent view that passes the viewModel
struct SwiftUI_render_observable_object: View {
    // The parent view creates and owns the viewModel
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        // Pass the viewModel to child views
        let _ = Self._printChanges()
        
        TaskListView(viewModel: viewModel)
    }
}

extension ShapeStyle where Self == Color {
    public static var debug: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_render_observable_object()
        .frame(width: 390, height: 500)
)

//: [Next](@next)
