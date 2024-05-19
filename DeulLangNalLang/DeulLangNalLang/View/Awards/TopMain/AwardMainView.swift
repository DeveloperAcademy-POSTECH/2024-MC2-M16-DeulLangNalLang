//
//  AwardMainView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct AwardMainView: View {
    @State var selection: Int = 0
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading) {
                
                UserSwichView()
                
                Text("이번주 상장을 확인해 \n보세요구르트")
                    .font(.DlnlHeadline)
                
                CarouselView()
                
                Text("상장이 n개 모였네요! \n아주 칭찬합니다람쥐")
                    .font(.DlnlHeadline)
                
                SegmentedPickerView(selection: $selection)
                
                if selection == 0 {
                    TotalAwardsListView()
                } else {
                    LikedAwardsListView()
                }
                
                
            }
            .border(Color.blue, width: 2)
            .padding()
            .animation(.easeInOut(duration: 0.2), value: selection)
        }
    }
}
#Preview {
    AwardMainView()
}
