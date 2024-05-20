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
                
                Text("이번 주 상장을 확인해 \n보세요구르트")
                    .font(.largeTitleEmphasized)
                    .padding(.bottom, 20)
                
                CarouselView()
                    .padding(.bottom)
                    .padding(.bottom, 20)
                
                Text("상장이 n개 모였네요! \n아주 칭찬합니다람쥐")
                    .font(.largeTitleEmphasized)
                
                SegmentedPickerView(selection: $selection)
                
                if selection == 0 {
                    TotalAwardListView()
                } else {
                    FavoriteAwardListView()
                }
                
                
            }
            .animation(.easeInOut(duration: 0.2), value: selection)
        }
    }
}
#Preview {
    AwardMainView()
}
