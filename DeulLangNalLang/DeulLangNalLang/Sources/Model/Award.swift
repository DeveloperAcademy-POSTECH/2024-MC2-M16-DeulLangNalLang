//
//  Award.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import Foundation
import SwiftData

@Model
class Award {
    @Attribute(.unique) var id = UUID()
    var title: String
    var contents: String
    var date: Date
    var isFavorite: Bool
    var themeName: String
    
    init(title: String, contents: String, date: Date, isFavorite: Bool, themeName: String) {
        self.title = title
        self.contents = contents
        self.date = date
        self.isFavorite = isFavorite
        self.themeName = themeName
    }
}

// MARK: - Protocols

extension Award: Equatable {
    static func == (lhs: Award, rhs: Award) -> Bool {
        return lhs.id == rhs.id
    }
}
