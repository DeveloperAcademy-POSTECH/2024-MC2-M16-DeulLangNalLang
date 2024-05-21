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
    
    static var dummy: [AwardData] = [
        AwardData(category: .cactus, title: "짱상"),
        AwardData(category: .octopus, title: "바보상"),
        AwardData(category: .gem, title: "호랑이상"),
        AwardData(category: .origami, title: "피자치킨상"),
        AwardData(category: .gem, title: "아메리카노상"),
        AwardData(category: .bicycle, title: "레모니와나기상"),
        AwardData(category: .cactus, title: "바나나껍질주움상")
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
            Text(data.title)
                .font(.headlineEmphasized)
        }
    }
}

#Preview {
    AwardThumbnailView(data: AwardData(category: .gem, title: "이정진 최@고"))
}
