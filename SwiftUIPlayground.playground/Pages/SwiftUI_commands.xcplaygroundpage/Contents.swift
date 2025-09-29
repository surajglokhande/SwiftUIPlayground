////: [Previous](@previous)
//import SwiftUI
//import PlaygroundSupport
//
//struct SwiftUI_commands: View {
//    var body: some View {
//        Text("Hello world!")
//    }
//}
//
////@main
//struct MyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            SwiftUI_commands()
//                .navigationTitle("Window Title")
//        }
//        .commands {
//                // Add customize toolbar menu items
//            ToolbarCommands()
//
//                // Add text editing menu items
//            TextEditingCommands()
//
//                // Addition to the built-in help menu
//            MyHelpCommands()
//
//                // A custom Find menu
//            MyFindCommands()
//
//                // A custom Build menu
//            MyBuildCommands()
//        }
//    }
//}
//
//struct MyHelpCommands: Commands {
//    var body: some Commands {
//        CommandGroup(after: .help) {
//            Button("Visit Website", action: contactSupport)
//
//            Button("Contact support", action: contactSupport)
//        }
//    }
//
//    func contactSupport() { }
//}
//
//struct MyFindCommands: Commands {
//    var body: some Commands {
//        CommandMenu("Find") {
//            Button("Find text", action: findText)
//
//            Button("Find Regular Expression", action: findRegEx)
//        }
//    }
//
//    func findText() { }
//    func findRegEx() { }
//}
//
//struct MyBuildCommands: Commands {
//    var body: some Commands {
//        CommandMenu("Program") {
//            Section {
//                Button("Build", action: compile)
//                    .keyboardShortcut(KeyboardShortcut(KeyEquivalent("b"), modifiers: [.command]))
//
//                Menu("Run") {
//                    Button("Run", action: runReplace)
//                        .keyboardShortcut(KeyboardShortcut(KeyEquivalent("r"), modifiers: [.command]))
//
//                    Button("Run as new instance", action: runNewInstance)
//                        .keyboardShortcut(KeyboardShortcut(KeyEquivalent("R"), modifiers: [.command]))
//                }
//            }
//
//            Section {
//                Button("Show log", action: showLogs)
//                    .keyboardShortcut(KeyboardShortcut(KeyEquivalent("L"), modifiers: [.command, .control]))
//
//                Button("Disable", action: disableLogs)
//            }
//        }
//    }
//
//    func compile() { }
//    func runNewInstance() { }
//    func runReplace() { }
//
//    func showLogs() { }
//    func disableLogs() { }
//}
//
//let hostingController = UIHostingController(rootView: MyApp())
//
//PlaygroundPage.current.setLiveView(
//    hostingController
//)
////: [Next](@next)
