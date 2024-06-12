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
    
    @State private var isBoastAddViewShown: Bool = false
    @State var showingBoasts: [Boast] = []
    
    @Query(filter: #Predicate<Boast> { $0.award == nil })
    var bothBoasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil && $0.writer == "류산" })
    var onlySanBoasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil && $0.writer == "류들" })
    var onlyDeulBoasts: [Boast]
    
    @State var mode: BoastCategory = .both
    
    var body: some View {
        
        let myBoasts = allBoasts.filter{
            $0.writer == user.name
        }
        
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
        ZStack (alignment: .bottomTrailing) {
            Color.DNBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center) {
                ScrollView{
                    if !weeklyBoasts.isEmpty {
                        HStack {
                            Text("\(user.name)님, 이번 주 상장을\n확인해보세요구르트")
                                .font(.largeTitleRegular)
                                .fontWeight(.heavy)
                                .padding(.bottom, 54)
                                .padding(.horizontal)
                                .padding(.top, 35)
                            Spacer()
                        }
                        CarouselView()
                            .padding(.bottom, 60)
                    }
                    
                    if !myBoasts.isEmpty {
                        
                        HStack{
                            Text("\(user.name)님, 상장이 \(myBoasts.count)개 모였네요! \n아주 칭찬합니다람쥐")
                                .font(.largeTitleRegular)
                                .fontWeight(.heavy)
                                .padding(.bottom, 58)
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
                    else {
                        AwardEmptyView()
                    }
                }
                .scrollIndicators(.hidden)
                .background(Color.DNBackground)
            }
            .animation(.easeInOut(duration: 0.2), value: awardListSelection)
                
                Button(action: {
                    self.isBoastAddViewShown.toggle()
                }, label: {
                    HStack(spacing: 0){
                        Image(systemName: "pencil.line")
                            .padding(.trailing, 10)
                        Text("자랑작성")
                    }
                    .font(.title3Regular).fontWeight(.semibold)
                    .frame(width: 148, height: 58)
                    .background(Color.yellow)
                    .foregroundColor(Color(hex: "#472200"))
                    .clipShape(Capsule())
                })
                .fullScreenCover(isPresented: $isBoastAddViewShown, onDismiss: {
                    updateShowingBoasts()
                }) {
                    BoastAddView(isBoastAddViewShown: $isBoastAddViewShown)
                }
                .padding(.bottom, 22)
                .padding(.trailing, 16)
        
        }
    }
    private func updateShowingBoasts() {
        switch mode {
        case .both:
            showingBoasts = bothBoasts
        case .onlyDeul:
            showingBoasts = onlyDeulBoasts
        case .onlySan:
            showingBoasts = onlySanBoasts
        }
    }
}
// segmented control height 조정

extension UISegmentedControl {
    
}

#Preview {
    AwardMainView()
}
