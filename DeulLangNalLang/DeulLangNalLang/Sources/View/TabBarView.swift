//
//  TabBarView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            UserSwitchView()
                .padding(.leading, 16)
            TabView {
                AwardMainView() // 첫 번째 탭 화면
                    .tabItem { // 탭바 버튼으로 등록
                        Image(systemName: "face.smiling.inverse")
                        Text("상장 박물관")
                    }
                
                BoastMainView() // 두 번째 탭 화면
                    .tabItem { // 탭바 버튼으로 등록
                        Image(systemName: "star.fill")
                        Text("자랑 우체국")
                    }
            }
        }
        .navigationBarBackButtonHidden()
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
