//: [Previous](@previous)
import Foundation
import SwiftUI
import PlaygroundSupport

class ViewModel: ObservableObject {
    @Published var dataList: [String] = []
    
    func addSetting1() async {
        let setting = "add setting 1 \(Thread.current)"
        self.dataList.append(setting)
    }
    func addSetting2() async {
        let setting = "add setting 2 \(Thread.current)"
        self.dataList.append(setting)
    }
    func addSetting3() async {
        let setting = "add setting 3 \(Thread.current)"
        self.dataList.append(setting)
    }
    func addSetting4() async {
        let setting = "add setting 4 \(Thread.current)"
        self.dataList.append(setting)
    }
}

struct SwiftUI_swift_concurrency_task: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.dataList, id: \.self) { item in
                Text(item)
            }
        }
//        .task(priority: .background) {
//            print("inside addSetting6 \(Thread.current)")
//            //            await viewModel.addSetting4()
//        }
//        .task(priority: .userInitiated) {
//            print("inside addSetting1 \(Thread.current)")
////            await viewModel.addSetting1()
//        }
//        .task(priority: .high) {
//            print("inside addSetting2 \(Thread.current)")
////            await viewModel.addSetting2()
//        }
//        .task(priority: .medium) {
//            print("inside addSetting3 \(Thread.current)")
////            await viewModel.addSetting3()
//        }
//        .task(priority: .low) {
//            print("inside addSetting4 \(Thread.current)")
////            await viewModel.addSetting4()
//        }
//        .task(priority: .utility) {
//            print("inside addSetting5 \(Thread.current)")
//            //            await viewModel.addSetting4()
//        }

        //        or
        .onAppear() {
            print("inside .onappear")
//            Task(priority: .low) {
//                print("inside 2nd .task")
//                await viewModel.addSetting()
//            }
            Task.detached(priority: .background) {
                print("inside addSetting6 \(Thread.current)")
                //            await viewModel.addSetting4()
            }
            Task(priority: .userInitiated) {
                print("inside addSetting1 \(Thread.current)")
                //            await viewModel.addSetting1()
            }
            Task(priority: .high) {
                print("inside addSetting2 \(Thread.current)")
                //            await viewModel.addSetting2()
            }
            Task(priority: .medium) {
                print("inside addSetting3 \(Thread.current)")
                //            await viewModel.addSetting3()
            }
            Task(priority: .low) {
                print("inside addSetting4 \(Thread.current)")
                //            await viewModel.addSetting4()
            }
            Task(priority: .utility) {
                print("inside addSetting5 \(Thread.current)")
                //            await viewModel.addSetting4()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_swift_concurrency_task()
        .frame(width: 390, height: 800)
)
//: [Next](@next)
