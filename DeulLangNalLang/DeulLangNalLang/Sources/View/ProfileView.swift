//
//  ProfileView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 6/13/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(User.self) var user: User
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                // 배경 색상 설정
                Color.DNBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack{
                        Text("Sannee0127@naver.com")
                            .font(.title2Regular)
                            .foregroundColor(.black)
                            .padding()
                        //  .frame(width: 361, height: 44, alignment: .topLeading)
                        //  .accentColor(.black)
                        Spacer()
                    }
                    
                    Text("프로필을 변경해 보세요")
                        .font(.bodyRegular)
                        .padding(.top, 140)
                    
                    HStack(alignment: .top, spacing: 13){
                        
                        Button(action: {},
                               label: {
                            ZStack{
                                Image("UserSan")
                                Text("산")
                                    .font(.title1Regular)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 57, alignment: .center)
                                    .padding(EdgeInsets(top: 58, leading: 45, bottom: 107, trailing: 45))
                            }
                        })
                        .padding(0)
                        .simultaneousGesture(TapGesture().onEnded {
                            user.name = "류산"
                        })
                        Button(action: {},
                               label: {
                            ZStack{
                                Image("UserDeul")
                                Text("들")
                                    .font(.title1Regular)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 57, alignment: .center)
                                    .padding(EdgeInsets(top: 58, leading: 45, bottom: 107, trailing: 45))
                            }
                        })
                        .simultaneousGesture(TapGesture().onEnded {
                            user.name = "류들"
                        })
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    HStack{
                        Button(action: {},
                               label: {
                            Text("로그아웃")
                                .font(.footnoteRegular)
                                .foregroundColor(.black)
                                .opacity(0.5)
                        })
                        
                        Spacer()
                        
                        Button(action: {},
                               label: {
                            Text("회원탈퇴")
                                .font(.footnoteRegular)
                                .foregroundColor(.black)
                                .opacity(0.5)
                        })
                    }
                    .padding(.horizontal, 103)
                    .padding(.bottom, 40)
                }
            }
            .accentColor(.black)
        }
    }
}


#Preview {
    ProfileView()
}
