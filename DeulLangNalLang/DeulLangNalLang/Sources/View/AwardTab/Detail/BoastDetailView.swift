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
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 329, height: 480)
                    .foregroundColor(.blue)
                VStack(spacing: 0){
                    //---------- 사진 1장일 때--------------
//                    Image("선인장")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 281, height: 220)
//                        .clipped()
//                        .cornerRadius(8)
//                        .padding(.top, 20)
                    
                    //---------- 사진 2장일 때--------------
                    HStack(spacing: 0){
                        Image("선인장")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 136, height: 220)
                            .clipped()
                            .cornerRadius(8)
                            .padding(.top, 20)
                            .padding(.horizontal, 5)

                        Image("선인장")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 136, height: 220)
                            .clipped()
                            .cornerRadius(8)
                            .padding(.top, 20)
                            .padding(.horizontal, 5)

                    }
                    
                    Text("오늘 들이가 배고프다고 해서 새로운 메뉴 파스타에 도전해봤다. 생각보다 쉽고 맛있었다. 다행히 들이도 맛있게 먹어준 것 같아서 좋았다. 오늘 들이가 배고프다고 해서 새로운 메뉴이다.")
                        .font(.bodyRegular)
                        .frame(width: 281, height: 152, alignment: .topLeading)
                        .padding(.vertical, 22)
                    Text("2024년 5월 5일")
                        .font(.bodyEmphasized)
                        .frame(width: 281, alignment: .leading)
                    Spacer()
                }
            }
            .frame(width: 329, height: 480)
            .padding(.bottom, 59)
        }
        .navigationTitle("상장과 자랑 보기")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("상장 박물관")
                    }
                }
            }
            ToolbarItem(placement: .bottomBar) {
                VStack(spacing: 0){
                    Divider()
                    
                    HStack(spacing: 0){
                        Spacer()
                        Button(action: {
                            isFavorite.toggle()
                            print("즐겨찾기 버튼 눌림: \(isFavorite ? "추가됨" : "제거됨")")
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                        }
                    }
                    .padding(.vertical, 13)
                }
            }
        }
    }
}

#Preview {
    BoastDetailView()
}
