//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct SwiftUI_offSet: View {
    var body: some View {
        VStack(spacing: 100) {
            Text("Offset by passing horizontal & vertical distance")
                .border(Color.green)
                .offset(x: 20, y: 50)
                .border(Color.gray)
            Text("Offset by passing CGSize()")
                .border(Color.green)
                .offset(CGSize(width: 20, height: 50))
                .border(Color.gray)
            
        }
//        ZStack(alignment: .bottomTrailing) {
//            Image(uiImage: #imageLiteral(resourceName: "project.png"))
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//            Text("Photo credit: Paul Hudson.")
//                .padding(4)
//                .background(.gray)
//                .foregroundStyle(.white)
//                .offset(x: 40, y: 0)
////                .offset(CGSize(width: 40, height: 0))
//        }
    }

}
PlaygroundPage.current.setLiveView(
	SwiftUI_offSet()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
