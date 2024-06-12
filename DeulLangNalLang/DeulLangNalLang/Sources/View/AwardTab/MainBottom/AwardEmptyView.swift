//
//  AwardEmptyView.swift
//  DeulLangNalLang
//
//  Created by hyeji on 5/20/24.
//

import SwiftUI

struct AwardEmptyView: View {
    
    @Environment(User.self) var user: User
    
    var body: some View {
    
        ZStack {
            // 배경 색상 설정
            Color.DNBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 0) {
                HStack{
                    Text("\(user.name)님, 상장이 아직\n모이지 않았어요를레히호")
                        .font(.title1Emphasized)
                        .fontWeight(.heavy)
                        .padding(.bottom, 20)
                        .padding(.horizontal)
                 Spacer()
                }
                Spacer().frame(height: 172)
                
                    Image("GrayDoor")
                        .frame(width: 32, height: 64)
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                Spacer().frame(height: 45)
                
                // Title2/KR_Emphasized
                Text("자랑 하나 주면 안 잡아먹지!")
                    .font(.title2Emphasized)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(width: 361, height: 28, alignment: .top)
                
                Spacer().frame(height: 2)
                
                Text("새로운 자랑을 작성해 보세요.")
                    .font(.bodyRegular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(width: 361, height: 48, alignment: .top)
                Spacer()
                
            }
        }
    }
}


#Preview {
    AwardEmptyView()
}
