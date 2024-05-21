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
    
    var partner: Username {
        switch self.name {
        case .San:
            return .Deul
        case .Deul:
            return .San
        }
    }
    
    var koreanName: String {
        switch self.name {
        case .San: "류산"
        case .Deul: "류들"
        }
    }

    
    init(name: Username) {
        self.name = name
    }
}

/// Username 종류(San / Deul)
enum Username {
    case San, Deul

}

// MARK: - Protocols

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
}
