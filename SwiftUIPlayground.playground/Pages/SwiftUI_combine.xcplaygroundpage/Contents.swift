//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport
import Combine

struct SwiftUI_combine: View {
    @StateObject var viewModel = CombineViewModel()

    var body: some View {
        ForEach(viewModel.users, id: \.id) { user in
            Text(user.username)
        }
    }
}

class CombineViewModel: ObservableObject {
    let service = CombineDataService()
    var justPublisherCancellable: AnyCancellable? = nil
    var cancellables: Set<AnyCancellable> = []

    @Published var userText = ""
    @Published var users: [UserModel] = []

    init() {
        test()

        service.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Finished fetching users")
                    case .failure(let error):
                        print("Fetching users error \(error)")
                }
            } receiveValue: { users in
                self.users = users
            }
            .store(in: &cancellables)
    }

    func test() {
        justPublisherCancellable = service.justPublisherExample().sink { _ in
            print("justPublisherExample complete")
        } receiveValue: { number in
            print("justPublisherExample \(number)")
        }

        service.futurePublisherExample()
            .map { str in
                "Transformed \(str)"
            }
            .sink { str in
                print("futurePublisherExample \(str)")
                self.userText = str
            }
            .store(in: &cancellables)

        service.anyPublisherExample()
            .filter{ $0 > 10 }
            .sink { _ in
                print("anyPublisherExample complete")
            } receiveValue: { num in
                print("anyPublisherExample \(num)")
            }
            .store(in: &cancellables)

    }
}

class CombineDataService {
    func fetchUsers() -> AnyPublisher<[UserModel], Error> {
        let api = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: api)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func justPublisherExample() -> Just<Int> {
        Just(100)
    }

    func futurePublisherExample() -> Future<String, Never> {
        Future { promise in
            promise(.success("Future Publisher Example"))
        }
    }

    func anyPublisherExample() -> AnyPublisher<Int, Never> {
        [1, 2, 3, 4, 50].publisher.eraseToAnyPublisher()
    }
}

struct UserModel: Decodable {
    let id: Int
    let name: String
    let username: String
}

PlaygroundPage.current.setLiveView(
    SwiftUI_combine()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
