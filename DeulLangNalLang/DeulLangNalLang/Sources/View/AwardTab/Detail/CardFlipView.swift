//
//  CardFlipView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI
import SwiftData

struct CardFlipView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @Query var boasts: [Boast]
    
    @State var isFlipped = false
    
    var boastID: UUID
    
    var boast: Boast {
        return boasts.first { $0.id == boastID }!
    }
    
    var body: some View {
        ZStack {
            Color.DNBackground.ignoresSafeArea()
            VStack(spacing: 0){
                ZStack {
                    if isFlipped {
                        BoastDetailView(boastID: boastID)
                    } else {
                        AwardDetailView(boastID: boastID)
                    }
                }
                .scaleEffect(x: isFlipped ? -1 : 1)
                .frame(width: 200, height: 300)
                .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: -1, z: 0))
                .animation(.easeInOut(duration: 0.6), value: isFlipped)
                .onTapGesture {
                    isFlipped.toggle()
                }
                .frame(width: 329, height: 480)
                
                Text("카드를 터치해서 뒷면을 확인해바라기!")
                    .font(.headlineEmphasized)
                    .foregroundColor(.gray)
                    .padding(.top, 32)
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("상장과 자랑 보기")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Image.chevronLeft
                            Text("상장 박물관")
                        }
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    VStack(spacing: 0){
                        Divider()
                        
                        HStack(spacing: 0){
                            Spacer()
                            Button(action: {
                                boasts.first { $0.id == boastID }!.award?.isFavorite.toggle()
                            }) {
                                (boast.award?.isFavorite ?? false ? Image.filledHeart : Image.unfilledHeart)
                                    .foregroundColor(.DNFavoriteRed)
                            }
                        }
                        .padding(.vertical, 13)
                    }
                }
            }
        }
    }
}


//#Preview {
//    CardFlipView()
//}
