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
    @Environment(User.self) var user: User
    
    @Query(filter: #Predicate<Boast> { $0.award != nil })
    private var allBoasts: [Boast]
    
    @State var awardListSelection: Int = 0
    @State var weeklyAwardSelection: Int = 0
    var weeklyBoasts: [Boast] {
        let calendar = Calendar.current
        let now = Date()
        
        guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: now)?.start else {
            return []
        }
        
        guard let endOfWeek = calendar.date(byAdding: .day, value: 6, to: startOfWeek) else {
            return []
        }
        
        return allBoasts.filter {
            guard let award = $0.award else {
                return false
            }
            
            return $0.writer == user.name && startOfWeek <= award.date && award.date <= endOfWeek
        }
    }
    
    var body: some View {
        let myBoasts = allBoasts.filter{
            $0.writer == user.name
        }
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
                CarouselView(currentIndex: $weeklyAwardSelection, weeklyBoasts: weeklyBoasts)
                    .padding(.bottom, 40)
                
                HStack{
                    Text("상장이 \(myBoasts.count)개 모였네요! \n아주 칭찬합니다람쥐")
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
                    FavoriteAwardListView(isWeeklyBoastExist: weeklyBoasts.count > 0)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: awardListSelection)
        }
    }
}
#Preview {
    AwardMainView()
}
