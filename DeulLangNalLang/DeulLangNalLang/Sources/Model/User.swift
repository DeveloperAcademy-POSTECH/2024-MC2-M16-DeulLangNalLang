//
//  User.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import Foundation

class User {
    var id = UUID()
    var name: Username
    
    init(name: Username) {
        self.name = name
    }
}

/// Username 종류(San / Deul)
enum Username {
    case San, Deul
    
    var partner: Username {
        switch self {
        case .San:
            return .Deul
        case .Deul:
            return .San
        }
    }
}

// MARK: - Protocols

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
}
