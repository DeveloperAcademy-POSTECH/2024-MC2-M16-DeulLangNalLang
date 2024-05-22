//
//  Award.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import Foundation

@Observable
class Award {
    var id = UUID()
    var title: String
    var contents: String
    var date: Date
    var isFavorite: Bool
    var receiver: User
    
    init(title: String, contents: String, date: Date, isFavorite: Bool, receiver: User) {
        self.title = title
        self.contents = contents
        self.date = date
        self.isFavorite = isFavorite
        self.receiver = receiver
    }
}

// MARK: - Protocols

extension Award: Equatable {
    static func == (lhs: Award, rhs: Award) -> Bool {
        return lhs.id == rhs.id
    }
}
