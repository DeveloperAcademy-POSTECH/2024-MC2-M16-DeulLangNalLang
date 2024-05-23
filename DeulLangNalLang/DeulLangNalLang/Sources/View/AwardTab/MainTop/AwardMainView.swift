//
//  AwardMainView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI
import SwiftData

struct AwardMainView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(filter: #Predicate<Boast> { $0.award != nil })
    private var allBoasts: [Boast]
    
    @State var awardListSelection: Int = 0
    @State var weeklyAwardSelection: Int = 0
    
    var body: some View {
        ScrollView{
            VStack (alignment: .center) {
                
                HStack {
                    Text("이번 주 상장을 확인해 \n보세요구르트")
                        .font(.largeTitleRegular)
                        .fontWeight(.heavy)
                        .padding(.bottom, 20)
                        .padding(.horizontal)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    CarouselView(currentIndex: $weeklyAwardSelection)
                    Spacer()
                }
                .padding(.bottom, 40)
                
                HStack{
                    Text("상장이 \(allBoasts.count)개 모였네요! \n아주 칭찬합니다람쥐")
                        .font(.largeTitleRegular)
                        .fontWeight(.heavy)
                        .padding(.bottom, 20)
                        .padding(.horizontal)
                    Spacer()
                }
                
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
