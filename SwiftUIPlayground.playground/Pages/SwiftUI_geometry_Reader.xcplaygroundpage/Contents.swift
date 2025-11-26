//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport
/*:
 ## GeometryReader
 - **GeometryReader** is a container view that gives you access to the size and position of its parent view. It lets you read the parent's dimensions and use that information to dynamically size or position child views.
 
 **Common use cases:**
 - Creating responsive layouts that adapt to screen size
 - Centering or positioning views relative to parent
 - Creating aspect-ratio dependent layouts
 - Building custom animations based on position
 - Making views fill available space proportionally

 **Important note:**
 - GeometryReader takes up all available space from its parent, so if you don't want it to be that large, wrap it appropriately or set explicit frame sizes.
 - GeometryReader is essential for building flexible, responsive UIs that work across different screen sizes and orientations.
 
 ## Disadvantages of GeometryReader:
 **1. Performance overhead**
 - GeometryReader can be computationally expensive, especially if used deeply nested or in scrolling lists. It recalculates on every layout change, which can cause lag.
 - GeometryReader recalculates on every layout change means it re-runs its closure and updates whenever the parent's size or position changes.
 - When you scroll the list, items appear/disappear, and GeometryReader recalculates for each one. With 100 items, this causes 100+ recalculations, causing lag.
 
 List {
     ForEach(items) { item in
         GeometryReader { geometry in  // ❌ Bad - recalculates for every item
             Text(item.name)
         }
     }
 }
 
 **2. Takes up all available space**
 - GeometryReader fills its parent completely, which can cause unexpected layout issues:
 
 VStack {
     GeometryReader { geometry in
         Text("Hello")  // Takes up entire VStack space
     }
     Button("Click") { }  // Gets pushed down
 }
 
 **3. Difficult to combine with other modifiers**
 - Layering GeometryReader with other layout modifiers often produces unpredictable results:
 
 GeometryReader { geometry in
     Text("Hello")
 }
 .padding()  // May not work as expected
 
 **4. Complicates view hierarchy**
 - Makes code harder to read and reason about, especially with multiple nested GeometryReaders:
 
 GeometryReader { g1 in
     GeometryReader { g2 in  // ❌ Confusing and slow
         Text("Nested")
     }
 }
 
 **5. Unnecessary in many cases**
 - Modern SwiftUI offers better alternatives like .containerRelativeFrame() (iOS 16+), @Namespace for animations, or simple frame() modifiers:
 
 // Old way with GeometryReader
 
 GeometryReader { geometry in
     Text("50%").frame(width: geometry.size.width * 0.5)
 }

 // Modern way (iOS 16+)
 
 Text("50%").containerRelativeFrame(.horizontal) { size in
     size * 0.5
 }
 
 **6. Causes layout cycles**
 - Can lead to layout thrashing in complex scenarios, causing jank and poor performance.
 
 ## When to use GeometryReader:
 You should use it when you need to dynamically size or position views based on the parent's dimensions, and there's no simpler alternative.

 **1. Creating responsive layouts that adapt to screen size:**
 */
struct ResponsiveLayout: View {
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > 600 {
                // Landscape/iPad - side by side
                HStack(spacing: 20) {
                    SidebarView()
                        .frame(width: geometry.size.width * 0.3)
                    ContentView()
                        .frame(width: geometry.size.width * 0.7)
                }
            } else {
                // Portrait/iPhone - stacked
                VStack(spacing: 20) {
                    SidebarView()
                    ContentView()
                }
            }
        }
    }
}
struct SidebarView: View {
    var body: some View {
        
    }
}
struct ContentView: View {
    var body: some View {
        
    }
}
/*:
 **2. Creating aspect-ratio dependent layouts:**
 */
struct AspectRatioBox: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Rectangle()
                    .fill(.blue)
                    .frame(height: geometry.size.width)  // Square based on width
                
                Text("Square Box")
            }
        }
    }
}
/*:
 **3. Percentage-based positioning:**
 */
struct PercentageLayout: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle().fill(.gray)
                
                VStack(spacing: 0) {
                    // Top 40%
                    Rectangle().fill(.blue)
                        .frame(height: geometry.size.height * 0.4)
                    
                    // Middle 30%
                    Rectangle().fill(.green)
                        .frame(height: geometry.size.height * 0.3)
                    
                    // Bottom 30%
                    Rectangle().fill(.red)
                        .frame(height: geometry.size.height * 0.3)
                }
            }
        }
    }
}
/*:
 **4. Creating parallax effects (single use, not in lists):**
 */
struct ParallaxHeader: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .offset(y: geometry.frame(in: .global).minY * 0.5)
                
                VStack {
                    Text("Parallax Header")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .frame(height: 300)
        }
    }
}
/*:
 **5. Making shapes responsive:**
 */
struct ResponsiveCircle: View {
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(.blue)
                .frame(
                    width: min(geometry.size.width, geometry.size.height),
                    height: min(geometry.size.width, geometry.size.height)
                )
        }
    }
}
/*:
 **When NOT to use it:**
 
 ❌ Don't use in List or ScrollView with many items
 
 ❌ Don't nest multiple GeometryReaders
 
 ❌ Don't use when simple frame() or .infinity works
 
 ❌ Don't use in frequently-updating views with animations
 
 
 **Modern alternatives (prefer these when possible):**
 */
// Instead of GeometryReader for 50% width:
struct AlternativeToGeometryReader: View {
    var body: some View {
        Text("Half width")
            .frame(maxWidth: .infinity)
            .frame(width: UIScreen.main.bounds.width * 0.5)

        // iOS 16+ - Container Relative Frame (better performance):
        Text("Half width")
            .containerRelativeFrame(.horizontal) { size, _ in
                size * 0.5
        }
    }
}
/*:
    GeometryReader
*/
struct SwiftUI_geometry_Reader: View {
    
    @State var slider_start_x = 0.0
    @State var slider_start_y = 0.0
    @State var slider_end_x = 0.0
    @State var slider_end_y = 0.0
    
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                print(geometry.size)
                                // Use position to create custom drag behavior
                            }
                    )
            }
        }
        .padding(50)
        .backgroundStyle(.red)
    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_geometry_Reader()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
