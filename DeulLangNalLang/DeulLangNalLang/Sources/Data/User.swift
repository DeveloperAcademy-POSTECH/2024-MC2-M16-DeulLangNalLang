//
//  User.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/23/24.
//

import SwiftUI

@Observable
class User {
    
//    static let shared = User()
//
//    private let userDefaults = UserDefaults.standard
//
//    private init() {}
//
//    var username: String {
//        get {
//            return userDefaults.string(forKey: "username") ?? ""
//        }
//        set {
//            userDefaults.set(newValue, forKey: "username")
//        }
//    }
    
    var name: String
    
    init(name: String){
        self.name = name
    }
}
