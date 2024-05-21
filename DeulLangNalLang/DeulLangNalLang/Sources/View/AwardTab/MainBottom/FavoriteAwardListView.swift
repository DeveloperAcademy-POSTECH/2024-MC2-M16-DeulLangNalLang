//
//  LikedAwardsListView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct FavoriteAwardListView: View {
    
    //목록을 1부터 100까지 만듬
    let data = AwardFavoriteData.favoriteDummy
    
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
        //GridItem(.adaptive(minimum:100)->레이아웃의 최소 사이즈를 100으로 정해서 화면을 그리드 형식으로 꽉 차게 만듦.
    ]
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            LazyVGrid(columns: columns, spacing: 20) {
                
                    ForEach(data) { awardFavoriteData in
                        AwardFavoriteView(data: awardFavoriteData)
                }
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    FavoriteAwardListView()
}
