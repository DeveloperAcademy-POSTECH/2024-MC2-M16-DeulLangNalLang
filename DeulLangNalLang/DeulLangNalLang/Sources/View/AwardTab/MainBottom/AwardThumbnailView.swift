//
//  AwardThumbnailView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/21/24.
//

import SwiftUI
import SwiftData

struct AwardThumbnailView: View {
    
    @Query var boasts: [Boast]
    
    var id: UUID
    
    var boast: Boast {
        return boasts.first { $0.id == id }!
    }
    
    var body: some View {
        VStack {
            Image.award(themeName: boast.award?.themeName ?? "octopus")
                .resizable()
                .scaledToFit()
                .overlay(alignment: .topTrailing){
                    if boast.award?.isFavorite ?? false {
                        Image.filledHeart
                            .font(.title3Emphasized)
                            .foregroundColor(.DNFavoriteRed)
                            .padding(4)
                    }
            }
            Text("\(boasts.first { $0.id == id }?.award?.title ?? "")")
                .font(.headlineEmphasized)
                .fixedSize()
        }
    }
}

