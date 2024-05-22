//
//  DeulLangNalLangApp.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/17/24.
//

import SwiftUI
import SwiftData

@main
struct DeulLangNalLangApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([Boast.self, Award.self])
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema,
                                      configurations: [modelConfiguration])
        } catch {
            fatalError("modelContainer가 생성되지 않았습니다: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserSelectView()
            }
            .environment(User(name: ""))
            .modelContainer(modelContainer)
        }
    }
}
