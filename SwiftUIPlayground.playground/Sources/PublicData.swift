//
//  PublicData.swift
//  
//
//  Created by Suraj Lokhande on 16/12/25.
//

import SwiftUI

public extension ShapeStyle where Self == Color {
    static var debug: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
