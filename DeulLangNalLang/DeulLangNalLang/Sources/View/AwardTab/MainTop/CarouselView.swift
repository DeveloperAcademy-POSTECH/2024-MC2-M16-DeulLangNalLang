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
    
    @Binding var currentIndex: Int
    @GestureState private var dragOffset: CGFloat = 0
    
    
    var weeklyBoasts: [Boast]
    
    var body: some View {
        VStack{
            ZStack{
                ForEach(0..<weeklyBoasts.count, id: \.self) { index in
                    let boast = weeklyBoasts[index]
                    AwardCarouselView(boast: boast)
                        .cornerRadius(20)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.0 : 0.9)
                        .offset(x: CGFloat(index - currentIndex) * 270 + dragOffset, y: 0)
                }
            }
            .padding(.bottom, 24)
            .gesture(
                DragGesture()
                    .onEnded({ value in
                        let threshold: CGFloat = 50
                        if value.translation.width > threshold {
                            withAnimation {
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -threshold {
                            withAnimation {
                                currentIndex = min(weeklyBoasts.count - 1,
                                                   currentIndex + 1)
                            }
                        }
                    })
            )
            HStack(spacing: 8) {
                ForEach(0..<weeklyBoasts.count, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color.black : Color.gray)
                        .animation(.easeInOut, value: currentIndex)
                        .frame(width: 8, height: 8)
                        .onTapGesture {
                            withAnimation {
                                self.currentIndex = index
                            }
                        }
                }
            }
        }
        .padding(.bottom, 30)
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
//
//#Preview {
//    CarouselView(currentIndex: .constant(1))
//}

