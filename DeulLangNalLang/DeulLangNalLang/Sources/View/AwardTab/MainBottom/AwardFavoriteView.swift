//
//  AwardFavoriteView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/20/24.
//

import SwiftUI
import SwiftData

struct AwardFavoriteView: View {
    
    @Query var boasts: [Boast]
    
    var boastID: UUID
    
    var award: Award {
        boasts.first { $0.id == boastID }?.award ??
        Award(title: "",
              contents: "",
              date: Date(),
              isFavorite: true,
              themeName: "")
    }
    
    var body: some View {
        VStack {
            VStack{
                VStack(alignment: .center, spacing: 12) {
                    //AwardTitle
                    Text("\(award.title) 상")
                        .font(.headlineEmphasized)
                        .foregroundColor(.black)
                    
                    //AwardBody
                    Text(award.contents)
                        .font(.caption2Regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .padding(.horizontal, 16)
                .padding(.top, 72)
                .padding(.bottom, 16)
                .frame(width: 176, height: 257, alignment: .top)
                .background(
                    Image.card(themeName: award.themeName)
                        .resizable()
                        .scaledToFit()
                )
                .cornerRadius(20)
            }
            Text("\(boasts.first{ $0.id == boastID }?.award?.title ?? "")")
                .font(.headlineEmphasized)
        }
    }
}
