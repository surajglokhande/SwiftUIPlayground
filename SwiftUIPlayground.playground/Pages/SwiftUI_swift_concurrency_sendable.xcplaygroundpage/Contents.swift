//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct UserInfo: Sendable {
    var name: String
}

final class ClassUserInfo: @unchecked Sendable {
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getClassData(_ update: String) {
        self.name = update
    }
}

actor SendableUserInfo {
    func getStructUser(_ info: UserInfo) {
        //
    }
    
    func getClassUser(_ info: ClassUserInfo) {
        info.getClassData("new data")
    }
}

@Observable
class SendableViewModel {
    
    var manager = SendableUserInfo()
    
    func getData() async {
        await manager.getStructUser(UserInfo(name: "Suraj"))
        await manager.getClassUser(ClassUserInfo(name: "Suraj"))
    }
}



struct SwiftUI_swift_concurrency_sendable: View {
    
    @State private var viewModel = SendableViewModel()
    
    var body: some View {
        Text("Hello World!")
            .task {
                await self.viewModel.getData()
            }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_swift_concurrency_sendable()
        .frame(width: 390, height: 800)
)

//: [Next](@next)
