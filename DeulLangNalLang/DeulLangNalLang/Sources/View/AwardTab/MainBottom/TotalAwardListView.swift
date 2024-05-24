//
//  TotalAwardsListView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI
import SwiftData

struct TotalAwardListView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(User.self) var user: User
    
    @Query(filter: #Predicate<Boast> { $0.award != nil })
    private var boasts: [Boast]
    
    
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
        //GridItem(.adaptive(minimum:100)->레이아웃의 최소 사이즈를 100으로 정해서 화면을 그리드 형식으로 꽉 차게 만듦.
    ]
    
    var body: some View {
        let myTotalAwardBoasts = boasts.filter {
            $0.writer == user.name
        }
        VStack(alignment: .leading){
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(myTotalAwardBoasts) { boast in
                    NavigationLink(destination: CardFlipView(boastID: boast.id)){
                        AwardThumbnailView(id: boast.id)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 200)
    }
}

#Preview {
    TotalAwardListView()
}
