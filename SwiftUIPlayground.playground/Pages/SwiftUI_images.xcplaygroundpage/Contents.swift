//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_images: View {
    var body: some View {
		VStackLayout {
			Image(systemName: "heart.fill")
				.resizable()
				//.font(.system(size:200))
				.foregroundStyle(.red)
				.frame(width: 100, height: 100)
				.background(.blue)
				//.clipped()

			Image(uiImage: #imageLiteral(resourceName: "swift.png"))
				.resizable()
				.frame(width: 100, height: 100)
				.aspectRatio(contentMode: .fit)
		}
        VStack{
            Image(systemName: "heart.fill")
                .resizable()
                //.font(.system(size:200))
                .foregroundStyle(.red)
                .frame(width: 100, height: 100)
                .background(.blue)
                //.clipped()

            Image(uiImage: #imageLiteral(resourceName: "swift.png"))
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)

//            Image("swift")
//                .resizable()
//                .frame(width: 100, height: 100)
//                //.aspectRatio(contentMode: .fit)



        }
    }
}


PlaygroundPage.current.setLiveView(
    SwiftUI_images()
        .frame(width: 390, height: 844)
)

//: [Next](@next)
