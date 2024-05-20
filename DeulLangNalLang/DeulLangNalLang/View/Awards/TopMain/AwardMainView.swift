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
                
                UserSwitchView()
                
                Text("이번 주 상장을 확인해 \n보세요구르트")
                    .font(.DlnlLargetitle)
                    .padding(.bottom, 20)
                
                CarouselView()
                    .padding(.bottom)
                    .padding(.bottom, 20)
                
                Text("상장이 n개 모였네요! \n아주 칭찬합니다람쥐")
                    .font(.DlnlLargetitle)
                
                SegmentedPickerView(selection: $selection)
                
                if selection == 0 {
                    TotalAwardsListView()
                } else {
                    LikedAwardsListView()
                }
                
                
            }
            .padding()
            .animation(.easeInOut(duration: 0.2), value: selection)
        }
    }
}
#Preview {
    AwardMainView()
}
