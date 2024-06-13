//
//  TabBarView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            UserSwitchView()
                .padding(.leading, 16)
                .padding(.bottom, 8)
                .padding(.top, 16)
            
            TabView {
                AwardMainView() // 첫 번째 탭 화면
                    .tabItem { // 탭바 버튼으로 등록
                        Image.awardMuseum
                        Text("상장 박물관")
                    }
                
                
                BoastMainView() // 두 번째 탭 화면
                    .tabItem { // 탭바 버튼으로 등록
                        Image.boastPostOffice
                        Text("자랑 우체국")
                    
                    }
                
                ProfileView() // 두 번째 탭 화면
                    .tabItem { // 탭바 버튼으로 등록
                        Image.profile
                        Text("프로필")
                    
                    }
            }
            .accentColor(.DNTabBarBlue)
        }
        .navigationBarBackButtonHidden()
        .background(Color.DNBackground)
    }
}

#Preview {
    TabBarView()
}
