//
//  LaunchScreenView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 6/9/24.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {
        
        ZStack {
       
                LottieView(jsonName: "DNLottie")
            }
            
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                isLoading.toggle()
//            })
        }

#Preview {
    LaunchScreenView()
}
