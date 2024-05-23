//
//  AwardFavoriteView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/20/24.
//

import SwiftUI
import SwiftData

struct AwardFavoriteData: Identifiable {
    let id: UUID = UUID()
    var favoriteCategory: AwardFavoriteCategory
    var title: String
}

enum AwardFavoriteCategory: String {
    case cactus, octopus, bicycle, gem, origami
    
    var image: Image {
        switch self {
        case .cactus: return Image(.cardCactus)
        case .octopus: return Image(.cardOctopus)
        case .bicycle: return Image(.cardBicycle)
        case .gem: return Image(.cardGem)
        case .origami: return Image(.cardOrigami)
        }
    }
}

struct AwardFavoriteView: View {
    
    @Query var boasts: [Boast]
        
    var boastID: UUID
        
        var body: some View {
            VStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 176, height: 267)
                Text("\(boasts.first{ $0.id == boastID }?.award?.title ?? "")")
                    .font(.headlineEmphasized)
            }
        }
}
