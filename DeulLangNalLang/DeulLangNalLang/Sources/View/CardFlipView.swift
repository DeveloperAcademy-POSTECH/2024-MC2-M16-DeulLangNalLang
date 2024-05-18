//
//  CardFlipView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI

@Observable
class CardPresenter {
  var isFlipped = false

  func flip() {
    isFlipped.toggle()
  }
}

struct CardFlipView: View {
    @State var presenter = CardPresenter()
    
    var body: some View {
        Group{
            if presenter.isFlipped {
                // scaleEffect를 적용하여 CardView를 반대로 뒤집어 둠.
                // rotation3DEffect로 앞 -> 뒤로 뒤집으려 할 때 뒤에 있던 View가 뒤집어진 채로 보이기 때문.
                TempBView()
                    .scaleEffect(x: -1)
            } else {
                TempAView()
            }
        }
        .cornerRadius(10)
        .frame(width: 300,
               height: 500)
        .onTapGesture {
            presenter.flip()
        }
        .rotation3DEffect(
            // 해당 각도로 만듦. 이때 UI가 자연스레 돌아가는 이유는 하단의 animation 덕분.
            .degrees(presenter.isFlipped
                     ? 180
                     : 0),
            // y축을 기준으로 돌리겠다는 의미
            axis: (x: 0,
                   y: 1,
                   z: 0)
        )
        // 자연스럽게 '보이던 View'는 사라지고 '안보이던 View'는 나타나는 효과
        .animation(.default, value: presenter.isFlipped)
    }
}


#Preview {
    CardFlipView()
}
