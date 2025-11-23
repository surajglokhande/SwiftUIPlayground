//: [Previous](@previous)
import SwiftUI
import Foundation
import PlaygroundSupport

/*:
    Example 1
 */
@propertyWrapper
struct Capitalized {
    var value: String = ""
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
    
    var wrappedValue : String {
        get {
            self.value
        }
        set {
            self.value = newValue.uppercased()
        }
    }
    
//    wrappedValue and projected value by condition
//    var wrappedValue : String {
//        get {
//            self.value.isEmpty ? projectedValue : value
//        }
//        set {
//            self.value = self.value.isEmpty ? newValue.uppercased() : projectedValue
//        }
//    }
    
    var projectedValue: String {
        value.isEmpty ? "empty" : value
    }
}

struct SwiftUI_property_custom_wrapperOne: View {
    
    @Capitalized private var firstName: String = "suraj"
    @Capitalized private var lastName: String = ""
    var body: some View {
        Text(firstName)
            .border(.red, width: 1)
        Text($lastName)
            .border(.red, width: 1)
    }
}

//PlaygroundPage.current.setLiveView(
//    SwiftUI_property_custom_wrapperOne()
//        .frame(width: 390, height: 844)
//)

/*:
    Example 2
 */
@propertyWrapper
struct Clamping<Value: Comparable> {
    private var value: Value
    private let minValue: Value
    private let maxValue: Value
    
    init(wrappedValue: Value, min minValue: Value, max maxValue: Value) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.value = max(minValue, min(maxValue, wrappedValue))
    }
    
    var wrappedValue : Value {
        get {
            self.value
        }
        set {
            self.value = max(minValue, min(maxValue, newValue))
            
        }
    }
}

struct SwiftUI_property_custom_wrapperTwo: View {
    
    @State @Clamping(min: 5, max: 10) private var value: Int = 0
    @State @Clamping(min: 5, max: 10) private var valueTwo: Int = 0
    var body: some View {
        Text("\(value)")
            .border(.red, width: 1)
        Text("\(valueTwo)")
            .border(.red, width: 1)
        Button {
            value = 6
        } label: {
            Text("tap")
        }

    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_property_custom_wrapperTwo()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
