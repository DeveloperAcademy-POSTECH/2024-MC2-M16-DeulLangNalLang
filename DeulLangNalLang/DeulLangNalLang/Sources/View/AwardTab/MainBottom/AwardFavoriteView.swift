//
//  AwardFavoriteView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/20/24.
//

import SwiftUI

struct AwardFavoriteData: Identifiable {
    let id: UUID = UUID()
    var favoriteCategory: AwardFavoriteCategory
    var title: String
    
    static var favoriteDummy: [AwardFavoriteData] = [
        AwardFavoriteData(favoriteCategory: .cactus, title: "짱상"),
        AwardFavoriteData(favoriteCategory: .octopus, title: "바보상"),
        AwardFavoriteData(favoriteCategory: .gem, title: "호랑이상"),
        AwardFavoriteData(favoriteCategory: .origami, title: "피자치킨상"),
        AwardFavoriteData(favoriteCategory: .gem, title: "아메리카노상"),
        AwardFavoriteData(favoriteCategory: .bicycle, title: "레모니와나기상"),
        AwardFavoriteData(favoriteCategory: .cactus, title: "바나나껍질주움상")
    ]
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
        
        let data: AwardFavoriteData
        
        var body: some View {
            VStack {
                data.favoriteCategory.image
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 176, height: 267)
                Text(data.title)
                    .font(.headlineEmphasized)
            }
        }
}

#Preview {
    AwardFavoriteView(data: AwardFavoriteData(favoriteCategory: .gem, title: "이정진 최@고"))
}
