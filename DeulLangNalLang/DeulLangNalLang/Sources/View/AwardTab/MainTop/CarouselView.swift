//
//  CarouselView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI
import SwiftData

struct CarouselView: View {
    @Environment(User.self) var user: User
    
    @Query var boasts: [Boast]
    
    @State var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    @Query(filter: #Predicate<Boast> { $0.award != nil })
    private var allBoasts: [Boast]
    
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
        
        VStack{
            
            ScrollView(.horizontal) {
                HStack(spacing: 25) {
                    ForEach(0..<weeklyBoasts.count, id: \.self) { index in
                        NavigationLink(destination: CardFlipView(boastID: weeklyBoasts[index].id)){
                            AwardCarouselView(boast: weeklyBoasts[index])
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins([.leading, .trailing], (UIScreen.main.bounds.width - 267) / 2, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            .padding(.bottom, 24)
            
//            HStack(spacing: 8) {
//                ForEach(0..<weeklyBoasts.count, id: \.self) { index in
//                    Circle()
//                        .fill(currentIndex == index ? Color.black : Color.gray)
//                        .animation(.easeInOut, value: currentIndex)
//                        .frame(width: 8, height: 8)
//                        .onTapGesture {
//                            withAnimation {
//                                self.currentIndex = index
//                            }
//                        }
//                }
//            }
        }
        .onChange(of: weeklyBoasts, {
            self.currentIndex = 0
        })
    }
    
    private func getCurrentWeekDates() -> (startOfWeek: Date, endOfWeek: Date)? {
        let calendar = Calendar.current
        let now = Date()
        
        guard let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: now)?.start else {
            return nil
        }
        
        let endOfWeek = calendar.date(byAdding: .day, value: 6, to: startOfWeek)
        return (startOfWeek, endOfWeek ?? startOfWeek)
    }
}

struct ScrollOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
