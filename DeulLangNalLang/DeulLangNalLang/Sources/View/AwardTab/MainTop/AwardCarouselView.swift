//
//  AwardCarouselView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/20/24.
//

import SwiftUI
import SwiftData


struct AwardCarouselView: View {
    var boast: Boast
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Image.card(themeName: boast.award?.themeName ?? "Octopus")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 5, x: 3, y: 3)
                
                VStack(spacing: 0){
                    Spacer(minLength: 112)
                    Text("\(boast.award?.title ?? "") 상")
                        .font(.largeTitleRegular)
                        .fontWeight(.heavy)
                    Text("\(boast.award?.contents ?? "")")
                        .frame(width: 176, height: 146)
                        .padding(.vertical, 12)
                        .font(.title3Emphasized)
                        .multilineTextAlignment(.center)
                    
                    Text("\(getDateFormat(date: boast.date))")
                        .font(.bodyEmphasized)
                        .padding(.bottom, 4)
                    
                    Text("\(boast.writer)")
                        .font(.headlineEmphasized)
                        .padding(.bottom, 40)
                }
            }
            .frame(width: 267, height: 391)
        }
    }
}

//#Preview {
//    AwardCarouselView((awardCategory: .gem))
//}
