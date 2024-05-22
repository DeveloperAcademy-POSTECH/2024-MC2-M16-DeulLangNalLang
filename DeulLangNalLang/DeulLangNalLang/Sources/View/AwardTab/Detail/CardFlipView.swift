//
//  CardFlipView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI

struct CardFlipView: View {
    
    
    @Environment(\.dismiss) var dismiss
    @State var isFlipped = false
    
    @State var boast = Boast(contents: "오늘 들이가 배고프다고 해서 새로운 메뉴 파스타에 도전해봤다. 생각보다 쉽고 맛있었다. 다행히 들이도 맛있게 먹어준 것 같아서 좋았다. 오늘 들이가 배고프다고 해서 새로운 메뉴이다.", 
                             date: Date(),
                             award: Award(title: "우리집 요리왕",
                                          contents: "산이는 부모님이 집에 안계실 때 부모님을 대신하여 들이가 배고픈지 물어보고 맛있는 밥을 만들어 주었기에 이 상을 수여합니다.",
                                          date: Date(),
                                          isFavorite: false,
                                          receiver: User(name: .San)))
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if isFlipped {
                    BoastDetailView(boast: boast)
                } else {
                    AwardDetailView(award: boast.award!)
                }
            }
            .scaleEffect(x: isFlipped ? -1 : 1)
            .frame(width: 200, height: 300)
            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: -1, z: 0))
            .animation(.easeInOut(duration: 0.6), value: isFlipped)
            .onTapGesture {
                isFlipped.toggle()
            }
            .frame(width: 329, height: 480)
            
            Text("터치해서 뒷면의 자랑을 확인해바라기!")
                .font(.caption1Regular)
                .foregroundColor(.gray)
                .padding(.top, 32)
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("상장과 자랑 보기")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack(spacing: 3) {
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
                            boast.award?.isFavorite.toggle()
                        }) {
                            Image(systemName: boast.award?.isFavorite ?? false ? "heart.fill" : "heart")
                        }
                    }
                    .padding(.vertical, 13)
                }
            }
        }
    }
}


#Preview {
    CardFlipView()
}
