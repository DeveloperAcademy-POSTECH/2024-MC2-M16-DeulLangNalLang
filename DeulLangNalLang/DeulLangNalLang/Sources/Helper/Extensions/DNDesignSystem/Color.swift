//
//  Color.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI

extension Color {
    
    /// hexcode Color
    /// # 사용 예시
    /// - init(hex: "#F1F1F1")
    /// - init(hex: "#F1F1F1", opacity: 0.1)
    init(hex: String, opacity: Double = 1.0) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xff) / 255
        let green = Double((rgb >> 8) & 0xff) / 255
        let blue = Double((rgb >> 0) & 0xff) / 255
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}


extension Color {
    
    enum Default {
        static let yellow = Color(hex: "#FFF5CB")
        static let green = Color(hex: "#1AC345")
        static let blue = Color(hex: "#007AFF")
    }
}


extension Color {
    static let DNBlue = Color("DNBlue")
    static let DNDarkBlue = Color("DNDarkBlue")
    static let DNDarkGreen = Color("DNDarkGreen")
    static let DNGreen = Color("DNGreen")
    static let DNBackground = Color("DNBackground")
    static let DNTabBarBlue = Color("DNTabBarBlue")
    
}


