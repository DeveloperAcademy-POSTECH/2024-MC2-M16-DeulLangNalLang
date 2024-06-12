//
//  BoastEmptyView.swift
//  DeulLangNalLang
//
//  Created by hyeji on 5/20/24.
//

import SwiftUI

struct BoastEmptyView: View {
    var onDismiss: () -> Void
    @State private var isBoastAddViewShown: Bool = false
    
    var body: some View {
        ZStack {
            // 배경 색상 설정
            Color.DNBackground
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack(spacing: 0){
                    
                    HStack {
                        Text("류들님\n새로운 자랑을 올려보세요")
                            .font(.title1Emphasized)
                            .fontWeight(.heavy)
                            .padding(.bottom, 20)
                            .padding(.horizontal)
                        Spacer()
                    }
                    Spacer().frame(height: 130)
                    
                    Image("EmptyViewimage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 85, height: 136)
                        .saturation(0)
                        .contrast(1.5)
                    //                Spacer().frame(height: 5)
                    
                    Text("들랑날랑하기")
                    
                        .font(.title2Emphasized)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(width: 361, height: 28, alignment: .top)
                    
                    Spacer().frame(height: 2)
                    
                    Text("자랑을 작성하고 상장을 모아보세요.")
                        .font(.bodyRegular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(width: 361, height: 22, alignment: .top)
                    
                    //MARK: 자랑하러 가기 버튼
                    //                Button(action: {
                    //                    isBoastAddViewShown.toggle()
                    //                }) {
                    //
                    //                    HStack(alignment: .center, spacing: 4) {Text("자랑하러 가기")}
                    //                        .padding(.horizontal, 14)
                    //                        .padding(.vertical, 7)
                    //                        .foregroundColor(.white)
                    //                        .background(Color(red: 0.31, green: 0.75, blue: 1))
                    //                        .cornerRadius(40)
                    //
                    //                }
                    //                .sheet(isPresented: $isBoastAddViewShown, onDismiss: {
                    //                    onDismiss()
                    //                }) {
                    //                    BoastAddView(isBoastAddViewShown: $isBoastAddViewShown)
                    //                }
                    
                    Spacer()
                }
            }
        }
    }
}
