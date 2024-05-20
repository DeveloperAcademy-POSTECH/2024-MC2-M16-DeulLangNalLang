//
//  CarouselView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        
        ScrollView(.horizontal){
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(width: 268, height: 390)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.green)
                    .frame(width: 268, height: 390)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(width: 268, height: 390)
                
            }
        }
    }
}

#Preview {
    CarouselView()
}
