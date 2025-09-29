//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct FileItem: Identifiable {
        // stored properties
    var name: String
    var childNodes: [FileItem]? = nil
    var size: Int64 = 0

        // computed properties
    var id: String { name }

    var isFolder: Bool { childNodes != nil }

    var iconName: String { isFolder ? "folder" : "doc.text" }

    var formattedSize: String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useBytes, .useKB, .useMB, .useGB]
        formatter.countStyle = .file

        return formatter.string(fromByteCount: size)
    }
}

struct SwiftUI_table_hierarchical_data: View {
    let data = [
        FileItem(name: "root", childNodes: [
            FileItem(name: "usr", childNodes: [
                FileItem(name: "lib", childNodes: [
                    FileItem(name: "libc++.dylib", size: 2738),
                    FileItem(name: "libm.dylib", size: 483)
                ])
            ]),
            FileItem(name: "etc", childNodes: [
                FileItem(name: "passwd", size: 3437),
                FileItem(name: "shadow", size: 3746),
                FileItem(name: "my.cnf", size: 8872),
                FileItem(name: "httpd", childNodes: [
                    FileItem(name: "httpd.conf", size: 87236),
                ])
            ])
        ])
    ]

    var body: some View {
            Table(data, children: \.childNodes) {
                TableColumn("Name") { node in
                    Label(node.name, systemImage: node.iconName)
                }

                TableColumn("Size") {
                    Text($0.isFolder ? "" : $0.formattedSize)
                }
            }
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_table_hierarchical_data()
        .background(.white)
        .frame(width: 390, height: 844)       
)

//: [Next](@next)
