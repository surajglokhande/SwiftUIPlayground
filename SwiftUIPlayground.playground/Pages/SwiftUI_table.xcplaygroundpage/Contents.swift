//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct SwiftUI_table: View {

    @AppStorage("tableCustomization") var customization: TableColumnCustomization<IdentifiableTimezone>


    let timezones = {
        TimeZone.knownTimeZoneIdentifiers
            .filter {
                $0.hasPrefix("Europe/")
            }
            .compactMap {
                IdentifiableTimezone(identifier: $0)
            }
    }()

    var body: some View {
        Table(timezones, columnCustomization: $customization) {
            TableColumn("Suraj", value: \.id)
                .customizationID("id")

            TableColumn("Abbreviation", value: \.abbreviation)
                .customizationID("abbr")

            TableColumn("Daylight") { Text($0.daylight ? "in effect" : "off") }
                .disabledCustomizationBehavior([.visibility, .resize])
                .customizationID("daylight")
                .defaultVisibility(.visible)

            TableColumn("Seconds from GMT") { Text("\($0.offset)") }
                .customizationID("seconds")
        }
    }
}

struct IdentifiableTimezone: Identifiable {
    let id: String
    let abbreviation: String
    let daylight: Bool
    let offset: Int

    init?(identifier: String) {
        guard let tz = TimeZone(identifier: identifier) else { return nil }

        self.id = identifier
        self.abbreviation = tz.abbreviation() ?? "?"
        self.daylight = tz.isDaylightSavingTime()
        self.offset = Int(tz.secondsFromGMT())

    }
}

PlaygroundPage.current.setLiveView(
    SwiftUI_table()
        .frame(width: 890, height: 844)
)

//: [Next](@next)
