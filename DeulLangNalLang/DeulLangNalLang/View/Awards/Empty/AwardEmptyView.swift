//
//  AwardEmptyView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct AwardEmptyView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            UserSwichView()
            
            Text("상장이 아직 모이지 \n않았어요를레이호")
            Image (systemName: "photo.artframe")
                .font(.system(size: 200))
        }
            VStack{
                Text("자랑을하고 상장을 모아보세요!")
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: { Text("\(Image(systemName: "arrowtriangle.right.fill"))자랑하러 가기")
                })
            }
        }
}
#Preview {
    AwardEmptyView()
}
