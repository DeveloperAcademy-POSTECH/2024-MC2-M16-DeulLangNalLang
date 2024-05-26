//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by  SAN RYU on 5/18/24.
//

import SwiftUI
import SwiftData

struct AwardDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query var boasts: [Boast]

    @State private var isFavorite: Bool = false
    
    var boastID: UUID
    
    var boast: Boast {
        return boasts.first { $0.id == boastID }!
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                Image.card(themeName: boast.award?.themeName ?? "cactus")
                    .shadow(radius: 5, x: 3, y: 3)
                
                VStack(spacing: 0){
                    Spacer(minLength: 120)
                    Text("\(boast.award?.title ?? "") 상")
                        .font(.largeTitleRegular)
                        .fontWeight(.heavy)
                    Text("\(boast.award?.contents ?? "")")
                        .frame(width: 229, height: 196)
                        .padding(.vertical, 12)
                        .font(.title3Emphasized)
                        .multilineTextAlignment(.center)
                    
                    Text("\(getDateFormat(date: boast.date))")
                        .font(.bodyEmphasized)
                        .padding(.bottom, 4)
                    
                    Text("\(boast.writer)")
                        .font(.headlineEmphasized)
                        .padding(.bottom, 51)
                }
            }
            .frame(width: 329, height: 480)
        }
    }
}
