//
//  AwardMainView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct AwardMainView: View {
    @State var awardListSelection: Int = 0
    @State var weeklyAwardSelection: Int = 0
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading) {
                
                Text("이번 주 상장을 확인해 \n보세요구르트")
                    .font(.largeTitleRegular)
                    .fontWeight(.heavy)
                    .padding(.bottom, 20)
                    .padding(.horizontal)
                
                HStack {
                    Spacer()
                    CarouselView(currentIndex: $weeklyAwardSelection)
                    Spacer()
                }
                .padding(.bottom, 40)
                
                Text("상장이 n개 모였네요! \n아주 칭찬합니다람쥐")
                    .font(.largeTitleRegular)
                    .fontWeight(.heavy)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                SegmentedPickerView(selection: $awardListSelection)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                
                if awardListSelection == 0 {
                    TotalAwardListView()
                } else {
                    FavoriteAwardListView()
                }
                
                
            }
            .animation(.easeInOut(duration: 0.2), value: awardListSelection)
        }
    }
}
#Preview {
    AwardMainView()
}
