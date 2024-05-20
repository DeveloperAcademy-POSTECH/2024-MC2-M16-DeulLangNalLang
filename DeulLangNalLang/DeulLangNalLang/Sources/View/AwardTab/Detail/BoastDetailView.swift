//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by  SAN RYU on 5/18/24.
//

import SwiftUI

struct BoastDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isFavorite: Bool = false
    var boast: Boast
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 329, height: 480)
                    .foregroundColor(.DNBlue)
                    .shadow(radius: 5, x: 3, y: 3)

                VStack(spacing: 0){
                    //---------- 사진 0장일 때 --------------
//                    Text("오늘 들이가 배고프다고 해서 새로운 메뉴 파스타에 도전해봤다. 생각보다 쉽고 맛있었다. 다행히 들이도 맛있게 먹어준 것 같아서 좋았다. 오늘 들이가 배고프다고 해서 새로운 메뉴이다.")
//                        .font(.bodyRegular)
//                        .frame(width: 281, height: 152, alignment: .topLeading)
//                        .padding(.top, 20)
//                    Spacer()
//                    Text("2024년 5월 5일")
//                        .font(.bodyEmphasized)
//                        .frame(width: 281, alignment: .leading)
//                        .padding(.bottom, 22)
                    
                    //---------- 사진 1장일 때 --------------
//                    Image("awardOrigami")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 281, height: 220)
//                        .clipped()
//                        .cornerRadius(8)
//                        .padding(.top, 20)
//                    
//                    Text("오늘 들이가 배고프다고 해서 새로운 메뉴 파스타에 도전해봤다. 생각보다 쉽고 맛있었다. 다행히 들이도 맛있게 먹어준 것 같아서 좋았다. 오늘 들이가 배고프다고 해서 새로운 메뉴이다.")
//                        .font(.bodyRegular)
//                        .frame(width: 281, height: 152, alignment: .topLeading)
//                        .padding(.vertical, 22)
//                    
//                    Text("2024년 5월 5일")
//                        .font(.bodyEmphasized)
//                        .frame(width: 281, alignment: .leading)
//                    Spacer()
                    
                    //---------- 사진 2장일 때--------------
//                    HStack(spacing: 0){
//                        Image("선인장")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 136, height: 220)
//                            .clipped()
//                            .cornerRadius(8)
//                            .padding(.top, 20)
//                            .padding(.horizontal, 5)
//
//                        Image("선인장")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 136, height: 220)
//                            .clipped()
//                            .cornerRadius(8)
//                            .padding(.top, 20)
//                            .padding(.horizontal, 5)
//
//                    }
                    
                    Text("\(boast.contents)")
                        .font(.bodyRegular)
                        .frame(width: 281, height: 152, alignment: .topLeading)
                        .padding(.vertical, 22)
                    Text("\(boast.date)")
                        .font(.bodyEmphasized)
                        .frame(width: 281, alignment: .leading)
                }
            }
            .frame(width: 329, height: 480)
            
            Text("터치해서 뒷면의 자랑을 확인해바라기!")
                .font(.caption1Regular)
                .foregroundColor(.gray)
                .padding(.top, 32)
        }
    }
}

