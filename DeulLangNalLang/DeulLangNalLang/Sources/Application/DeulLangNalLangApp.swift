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
    @State var permissionManager = PermissionManager()
    @State var isLaunching: Bool = true
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
                
                if isLaunching {
                    ZStack{
                        LaunchScreenView()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                    isLaunching = false
                                }
                            }
                    }
                } else {
                    UserSelectView()
                        .onAppear {
                            permissionManager.requestCameraPermission()
                        }
                    
                }
            }
            .environment(User(name: ""))
            .modelContainer(modelContainer)
        }
    }
}

