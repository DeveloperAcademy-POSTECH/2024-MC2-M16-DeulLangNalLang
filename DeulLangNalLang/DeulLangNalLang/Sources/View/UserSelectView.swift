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
            VStack {
                Text("당신은 누구새우깡?")
                    .font(.largeTitleRegular)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .frame(width: 361, height: 44, alignment: .topLeading)
                    .padding(.top, 68)
                HStack(alignment: .top, spacing: 9){
                    NavigationLink(destination: TabBarView()) {
                        Text("산")
                            .font(.title1Regular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        .frame(width: 46, height: 50, alignment: .center) }
                    .padding(0)
                    .frame(width: 176, height: 192, alignment: .center)
                    .background(Constants.ButtonFill)
                    .cornerRadius(16)
                    .simultaneousGesture(TapGesture().onEnded {
                        user.name = "류산"
                    })
                    
                    NavigationLink(destination: TabBarView()) {
                        Text("들")
                            .font(.title1Regular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 46, height: 50, alignment: .center)
                            .padding(0)
                            .frame(width: 176, height: 192, alignment: .center)
                            .background(Constants.ButtonFill)
                            .cornerRadius(16)
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

