//
//  AwardThumbnailView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/21/24.
//

import SwiftUI
import SwiftData

struct AwardData: Identifiable {
    let id: UUID = UUID()
    var category: AwardCategory
    var title: String
}

enum AwardCategory: String {
    case cactus, octopus, bicycle, gem, origami
    
    var image: Image {
        switch self {
        case .cactus: return Image(.awardCactus)
        case .octopus: return Image(.awardOctopus)
        case .bicycle: return Image(.awardBicycle)
        case .gem: return Image(.awardGem)
        case .origami: return Image(.awardOrigami)
        }
    }
}

struct AwardThumbnailView: View {
    
    @Query var boasts: [Boast]
    
    var id: UUID
    
    var boast: Boast {
        return boasts.first { $0.id == id }!
    }
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .overlay(alignment: .topTrailing){
                    if boast.award?.isFavorite ?? false {
                        Image(systemName: "heart.fill")
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

