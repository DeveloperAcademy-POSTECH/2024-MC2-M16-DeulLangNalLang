//
//  Boast.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI
import SwiftData

@Model
class Boast {
    @Attribute(.unique) var id = UUID()
    var contents: String
    /// 이미지 개수: 0~2개
    var imageDatas: [Data] = []
    var date: Date
    @Relationship(deleteRule: .cascade) var award: Award?
    var writer: String
    
    init(contents: String, date: Date, writer: String) {
        self.contents = contents
        self.date = date
        self.writer = writer
    }
}

// MARK: - Protocols

extension Boast: Hashable {
    static func == (lhs: Boast, rhs: Boast) -> Bool {
        lhs.id == rhs.id
    }
    
    /// Boast를 id 기준으로 Set, Dictionary에서 사용
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

