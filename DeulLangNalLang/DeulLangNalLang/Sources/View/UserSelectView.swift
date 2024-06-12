//
//  UserSelectView.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/19/24.
//

import SwiftUI

struct Constants {
    static let ButtonFill: Color = Color(red: 0.87, green: 0.87, blue: 0.87)
}

struct UserSelectView: View {
    @Environment(User.self) var user: User
    var body: some View {
        NavigationStack {
            
            ZStack {
                // 배경 색상 설정
                Color.DNBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("당신은 누구새우깡?")
                        .font(.largeTitleRegular)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .frame(width: 361, height: 44, alignment: .topLeading)
                        .padding(.top, 68)
                    HStack(alignment: .top, spacing: 13){
                        NavigationLink(destination: TabBarView()) {
                            ZStack{
                                Image("UserSan")
                                Text("산")
                                    .font(.title1Regular)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 57, alignment: .center)
                                    .padding(EdgeInsets(top: 58, leading: 45, bottom: 107, trailing: 45))
                            }
                        }
                        .padding(0)
                        .simultaneousGesture(TapGesture().onEnded {
                            user.name = "류산"
                        })
                        NavigationLink(destination: TabBarView()) {
                            ZStack{
                                Image("UserDeul")
                                Text("들")
                                    .font(.title1Regular)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 57, alignment: .center)
                                    .padding(EdgeInsets(top: 58, leading: 45, bottom: 107, trailing: 45))
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            user.name = "류들"
                        })
                    }
                    .padding(.top, 164)
                    Spacer()
                }
            }
        }
    }
}
