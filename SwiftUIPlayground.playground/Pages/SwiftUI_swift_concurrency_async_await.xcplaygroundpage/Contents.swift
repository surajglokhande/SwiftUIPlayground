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
        .onAppear() {
            Task {
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
