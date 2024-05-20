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
    var award: Award
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Image("cardCactus")
                    .shadow(radius: 5, x: 3, y: 3)
                
                VStack(spacing: 0){
                    Spacer(minLength: 120)
                    Text("\(award.title) 상")
                        .font(.largeTitleRegular)
                        .fontWeight(.heavy)
                    Text("\(award.contents)")
                        .frame(width: 229, height: 196)
                        .padding(.vertical, 12)
                        .font(.title3Emphasized)
                        .multilineTextAlignment(.center)
                    
                    Text("\(getDateFormat(date: award.date))")
                        .font(.bodyEmphasized)
                        .padding(.bottom, 4)
                    
                    Text("\(award.receiver.koreanName)")
                        .font(.headlineEmphasized)
                        .padding(.bottom, 51)
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
