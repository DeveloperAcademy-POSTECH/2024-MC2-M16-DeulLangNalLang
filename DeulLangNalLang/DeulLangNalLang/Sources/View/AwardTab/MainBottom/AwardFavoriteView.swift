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
            VStack{
                VStack(alignment: .center, spacing: 12) {
                    HStack{
                        //AwardTitle
                        Text("일이삼사오육칠팔")
                            .font(.headlineEmphasized)
                            .foregroundColor(.black)
                        Text("상")
                            .font(.headlineEmphasized)
                            .foregroundColor(.black)
                    }
    
                    //AwardBody
                    Text("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려 강산 대한 사람 대한으로 길이 보전하세 남산 위에 저 소나무 철갑을 두른 듯 바람 서리 불변함은 ")
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
                    cardImage(themeName: "Octopus")
                        .resizable()
                        .scaledToFit()
                )
                .cornerRadius(20)
            }
            Text("\(boasts.first{ $0.id == boastID }?.award?.title ?? "")")
                .font(.headlineEmphasized)
        }
        
        //원래 별 이미지
        //            VStack {
        //                Image(systemName: "star.fill")
        //                    .resizable()
        //                    .scaledToFit()
        //                    .frame(width: 176, height: 267)
        //                Text("\(boasts.first{ $0.id == boastID }?.award?.title ?? "")")
        //                    .font(.headlineEmphasized)
        //            }
    }
}
