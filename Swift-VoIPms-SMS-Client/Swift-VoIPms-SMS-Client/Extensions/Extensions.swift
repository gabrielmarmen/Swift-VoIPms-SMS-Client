//
//  Extensions.swift
//  Swift-VoIPms-SMS-Client
//
//  Created by Gabriel Marmen on 2023-01-25.
//

import Foundation
import SwiftUI

extension Color {
    
    //Used to generate a Color view using a hex value
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
    //A generic gray used for UI elements in lightmode
    static var lightModeGray: Color {
        Color(hex: 0xf5f5f5)
    }
    
    //A generic gray used for UI elements in darkmode
    static var darkModeGray: Color {
        Color(hex: 0x303030)
    }
}
