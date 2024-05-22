//
//  AwardThumbnailView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/21/24.
//

import SwiftUI

struct AwardData: Identifiable {
    let id: UUID = UUID()
    var category: AwardCategory
    var title: String
    var isFavorit: Bool
    
    static var dummy: [AwardData] = [
        AwardData(category: .cactus, title: "짱상", isFavorit: true),
        AwardData(category: .octopus, title: "바보상", isFavorit: true),
        AwardData(category: .gem, title: "호랑이상", isFavorit: false),
        AwardData(category: .origami, title: "피자치킨상", isFavorit: true),
        AwardData(category: .gem, title: "아메리카노상", isFavorit: true),
        AwardData(category: .bicycle, title: "레모니와나기상", isFavorit: true),
        AwardData(category: .cactus, title: "바나나껍질주움상", isFavorit: false)
    ]
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
    let data: AwardData
    
    var body: some View {
        VStack {
            data.category.image
                .resizable()
                .scaledToFit()
                .overlay(alignment: .topTrailing){
                    if data.isFavorit {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.DNDarkBlue)
                            .padding(4)
                    }
            }
            Text(data.title)
                .font(.headlineEmphasized)
                .fixedSize()
        }
    }
}

#Preview {
    AwardThumbnailView(data: AwardData(category: .gem, title: "장왕소최고", isFavorit: true))
}
