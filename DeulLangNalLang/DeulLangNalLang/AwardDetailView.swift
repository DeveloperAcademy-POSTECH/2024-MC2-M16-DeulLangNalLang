//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by  SAN RYU on 5/18/24.
//

import SwiftUI

struct AwardDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 329, height: 480)
                    .foregroundColor(Color(red: 26/255, green: 195/255, blue: 69/255))
                VStack(spacing: 0){
                    Rectangle()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                        .padding(20)
                    Spacer()
                }
                
                Image("선인장")
                
                VStack(spacing: 0){
                    Spacer()
                    HStack(spacing: 0){
                        Text("우리집 요리왕")
                        Text("상")
                    }
                    .font(.largeTitleRegular)
                    .fontWeight(.heavy)
                    
                    
                    Text("산이는 부모님이 집에 안계실 때 부모님을 대신하여 들이가 배고픈지 물어보고 맛있는 밥을 만들어 주었기에 이 상을 수여합니다.")
                        .frame(width: 233, height: 233)
                        .padding(.vertical, 12)
                        .font(.title3Emphasized)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                    Text("2024년 5월 5일")
                        .fontWeight(.semibold)
                        .font(.bodyEmphasized)
                    Text("류들")
                        .font(.headlineEmphasized)
                        .fontWeight(.regular)
                        .padding(.top, 5)
                        .padding(.bottom, 22)


                    
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
                    HStack(spacing: 3){
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
    AwardDetailView()
}
