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
        Group{
            if !isFlipped {
                // scaleEffect를 적용하여 CardView를 반대로 뒤집어 둠.
                // rotation3DEffect로 앞 -> 뒤로 뒤집으려 할 때 뒤에 있던 View가 뒤집어진 채로 보이기 때문.
                BoastDetailView(boastID: boastID)
            } else {
                AwardDetailView(boastID: boastID)
            }
        }
        .scaleEffect(x: isFlipped ? -1 : 1)
        .cornerRadius(10)
        .frame(width: 300,
               height: 500)
        .rotation3DEffect(
            // 해당 각도로 만듦. 이때 UI가 자연스레 돌아가는 이유는 하단의 animation 덕분.
            .degrees(isFlipped
                     ? 180
                     : 0),
            // y축을 기준으로 돌리겠다는 의미
            axis: (x: 0,
                   y: 1,
                   z: 0)
        )
        // 자연스럽게 '보이던 View'는 사라지고 '안보이던 View'는 나타나는 효과
        .animation(.default, value: isFlipped)
        .onTapGesture {
            self.isFlipped.toggle()
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("상장과 자랑 보기")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack(spacing: 3) {
                        Image(systemName: "chevron.left")
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
                            Image(systemName: boast.award?.isFavorite ?? false ? "heart.fill" : "heart")
                        }
                    }
                    .padding(.vertical, 13)
                }
            }
        }
    }
}


//#Preview {
//    CardFlipView()
//}
