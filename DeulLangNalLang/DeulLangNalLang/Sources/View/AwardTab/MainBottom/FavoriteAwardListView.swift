//
//  LikedAwardsListView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI
import SwiftData

struct FavoriteAwardListView: View {
    
    @Environment(User.self) var user: User
    
    @Query private var boasts: [Boast]
    
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
        //GridItem(.adaptive(minimum:100)->레이아웃의 최소 사이즈를 100으로 정해서 화면을 그리드 형식으로 꽉 차게 만듦.
    ]
    
    var body: some View {
        let favoriteBoasts = boasts.filter {
            guard let award = $0.award else { return false }
            return $0.writer != user.name && award.isFavorite
        }
        VStack(alignment: .leading){
            LazyVGrid(columns: columns, spacing: 20) {
                
                ForEach(favoriteBoasts, id: \.self) { boast in
                    NavigationLink(destination: CardFlipView(boastID: boast.id)){
                        AwardFavoriteView(boastID: boast.id)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

