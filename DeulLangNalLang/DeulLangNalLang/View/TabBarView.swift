//
//  TabBarView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            TabSub1View() // 첫 번째 탭 화면
                .tabItem { // 탭바 버튼으로 등록
                    Image(systemName: "1.circle")
                    Text("첫 번째 탭바 버튼")
                }
            
            TabSub2View() // 두 번째 탭 화면
                .tabItem { // 탭바 버튼으로 등록
                    Image(systemName: "2.circle")
                    Text("두 번째 탭바 버튼")
                }
        }
        .navigationTitle("탭 바 전환")
    }
}

struct TabSub1View: View { // 첫 번째 탭 화면
    var body: some View {
        
        AwardMainView()

        }
    }

struct TabSub2View: View { // 두 번째 탭 화면
    var body: some View {
        VStack {
            Image(systemName: "2.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            Text("두 번째 탭")
        }
    }
}

#Preview {
    TabBarView()
}
