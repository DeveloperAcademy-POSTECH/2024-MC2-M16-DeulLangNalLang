//
//  Date.swift
//  DeulLangNalLang
//
//  Created by Jen on 5/18/24.
//

import SwiftUI

extension Date {
    func getFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: self)
    }
}
