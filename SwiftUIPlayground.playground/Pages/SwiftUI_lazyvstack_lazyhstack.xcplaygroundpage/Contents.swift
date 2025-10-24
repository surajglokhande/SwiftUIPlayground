//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_lazyvstack_lazyhstack: View {
    var body: some View {
//        VStack {
//            ScrollView {
//                LazyVStack(spacing: 10) {
//                    ForEach(0..<1000) { index in
//                        Text("Item \(index)")
//                            .frame(height: 50)
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue.opacity(0.2))
//                            .cornerRadius(8)
//                            .onAppear {
//                                print("Item \(index) appeared")
//                            }
//                    }
//                }
//                .padding()
//            }
//            ScrollView(.horizontal) {
//                LazyHStack(spacing: 10) {
//                    ForEach(0..<1000) { index in
//                        Text("Item \(index)")
//                            .frame(width: 100, height: 100)
//                            .background(Color.green.opacity(0.2))
//                            .cornerRadius(8)
//                    }
//                }
//                .padding()
//            }
//        }
        ScrollView {
            LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders]) {
                Section(header: Text("Section 1")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .padding()) {
                        ForEach(0..<20) { index in
                            Text("Section 1 Item \(index)")
                        }
                    }
                
                Section(header: Text("Section 2")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .padding()) {
                        ForEach(0..<20) { index in
                            Text("Section 2 Item \(index)")
                        }
                    }
            }
        }
    }
}
PlaygroundPage.current.setLiveView(
    SwiftUI_lazyvstack_lazyhstack()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
