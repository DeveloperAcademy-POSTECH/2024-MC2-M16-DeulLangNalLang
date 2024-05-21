//
//  CarouselView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI
struct CarouselView: View {
    
    @Binding var currentIndex: Int
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["cardOctopus", "cardGem", "cardCactus", "cardBicycle", "cardOrigami"]
    
    var body: some View {
        
        //  NavigationStack{
        VStack{
            ZStack{
                ForEach(0..<images.count, id: \.self) { index in Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 268, height: 390)
                        .cornerRadius(20)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.0 : 0.9)
                        .offset(x: CGFloat(index - currentIndex) * 270 + dragOffset, y: 0)
                }
            }
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
                                currentIndex = min(images.count - 1,
                                                   currentIndex + 1)
                            }
                        }
                    })
                )
            HStack(spacing: 8) {
                ForEach(0..<5) { i in
                    Circle()
                        .fill(currentIndex == i ? Color.black : Color.gray)
                        .animation(.easeInOut, value: currentIndex)
                }
            }
            .frame(width: 70, height: 70)
        }
    }
}

#Preview {
    CarouselView(currentIndex: .constant(1))
}

