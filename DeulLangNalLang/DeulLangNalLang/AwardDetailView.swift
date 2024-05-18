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
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 329, height: 480)
                .foregroundColor(Color(red: 26/255, green: 195/255, blue: 69/255))
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
    AwardDetailView()
}
