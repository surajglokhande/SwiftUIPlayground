//: [Previous](@previous)
import Foundation
import SwiftUI
import PlaygroundSupport
import UIKit

struct SwiftUI_text: View {
    @State var current = Date()

    let interval = DateInterval(start: Date(), duration: 120)

    let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!

    let oneHourAgo = Calendar.current.date(byAdding: .hour, value: -1, to: Date())!
    let astr1: AttributedString = {

        var s1 = AttributedString("AttributedString")
        s1.font = .body.monospaced()

        var s2 = AttributedString("this page")
        s2.link = URL(string: "https://developer.apple.com/documentation/foundation/attributedstring/")

        return "To learn more about " + s1 + " visit " + s2
    }()

    let astr2: AttributedString = {
        let urlText = "https://developer.apple.com/documentation/foundation/attributedstring/"

        return try! AttributedString(markdown: "To learn more about `AttributedString` visit [this page](\(urlText))")
    }()

    var body: some View {

        //AttributedString
        Text(astr1)
        Text(astr2)
        Text("To learn more about `AttributedString` visit [this page](https://developer.apple.com/documentation/foundation/attributedstring/)")

        //Styled Date
        Text("Time: ").fontWeight(.heavy) + Text(current, style: .time)
        Text("Date: ").fontWeight(.heavy) + Text(current, style: .date)
        Text("Relative: ").fontWeight(.heavy) + Text(current, style: .relative)
        Text("Offset: ").fontWeight(.heavy) + Text(current, style: .offset)
        Text("Timer: ").fontWeight(.heavy) + Text(current, style: .timer)

        //Date Range
        Text("A range between yesterday and tomorrow: ") + Text(yesterday...tomorrow)
        Text("A range between an hour ago and now: ") + Text(oneHourAgo...current)

        //Image
        Text("Click on the ")
        + Text(Image(systemName: "info.circle.fill")).foregroundColor(.accentColor)
        + Text(" button")

        //Formatted Text
        Text(100, format: .currency(code: "EUR"))

        //Date Interval
        Text(interval)
            .font(.largeTitle)

        //Localized String
        Text(LocalizedStringKey("Hello World"),
             tableName: "secondary",
             bundle: Bundle(identifier: "otherBundle"),
             comment: "Hello World Message")

        //Localized String Resource
        Text(LocalizedStringResource("Hello World"))

        //TimeDataSource
            // Date
        Text("Current Date: ").fontWeight(.bold) +
        Text(.currentDate, format: .dateTime)

            // Range<Date> -> date..<max(date, Date.now)
        Text("Date Range (starting at): ").fontWeight(.bold) +
        Text(.dateRange(startingAt: Date().addingTimeInterval(-1000)), format: .timeDuration)

            // Range<Date> -> min(date, Date.now)..<date
        Text("Date Range (ending at): ").fontWeight(.bold) +
        Text(.dateRange(endingAt: Date().addingTimeInterval(1000)), format: .timeDuration)

            // Duration
        HStack {
            Text("Timer: ").fontWeight(.bold) +
            Text(.durationOffset(to: current), format: .time(pattern: .minuteSecond))

            Button("Reset Timer") {
                self.current = .now
            }
        }

    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_text()
        .frame(width: 390, height: 844)
)
//: [Next](@next)
