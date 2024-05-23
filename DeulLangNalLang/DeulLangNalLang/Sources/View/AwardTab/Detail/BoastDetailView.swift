//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by  SAN RYU on 5/18/24.
//

import SwiftUI
import SwiftData

struct BoastDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @Query var boasts: [Boast]
    
    @State private var isFavorite: Bool = false
    
    var boastID: UUID
    
    var boast: Boast {
        return boasts.first { $0.id == boastID }!
    }
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 329, height: 480)
                    .foregroundColor(.DNBlue)
                    .shadow(radius: 5, x: 3, y: 3)
                
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        ForEach(boast.imageDatas, id: \.self) { data in
                            if let image = UIImage(data: data) {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 136, height: 220)
                                    .clipped()
                                    .cornerRadius(8)
                                    .padding(.top, 20)
                                    .padding(.horizontal, 5)
                            }
                        }
                        
                    }
                    
                    Text("\(boast.contents)")
                        .font(.bodyRegular)
                        .frame(width: 281, height: 152, alignment: .topLeading)
                        .padding(.vertical, 22)
                    Text("\(getDateFormat(date: boast.date))")
                        .font(.bodyEmphasized)
                        .frame(width: 281, alignment: .leading)
                }
            }
            .frame(width: 329, height: 480)
        }
    }
}

