//: [Previous](@previous)
import Foundation
import SwiftUI
import PlaygroundSupport

class ViewModel: ObservableObject {
    @Published var dataList: [String] = []
    
    func addSetting() async {
        let setting = "add setting 1 \(Thread.current)"
        self.dataList.append(setting)
    }
}

struct SwiftUI_swift_concurrency_async_await: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataList, id: \.self) { item in
                Text(item)
            }
        }
        .task(priority: .userInitiated) {
            print("inside .task")
            await viewModel.addSetting()
        }
//        or
        .onAppear() {
            print("inside .onappear")
            Task(priority: .low) {
                print("inside 2nd .task")
                await viewModel.addSetting()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_swift_concurrency_async_await()
        .frame(width: 390, height: 800)
)
//: [Next](@next)
