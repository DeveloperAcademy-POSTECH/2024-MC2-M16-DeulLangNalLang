//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by  SAN RYU on 5/18/24.
//

import SwiftUI

struct BoastDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isFavorite: Bool = false
    @State private var images: [Image] = [Image(.awardOctopus), Image(.awardGem)]
    
    
    
    var boast: Boast
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 329, height: 480)
                    .foregroundColor(.DNBlue)
                    .shadow(radius: 5, x: 3, y: 3)
                
                VStack(spacing: 0){
                    if images.count == 0 {
                        Text("\(boast.contents)")
                            .font(.bodyRegular)
                            .frame(width: 281, height: 152, alignment: .topLeading)
                            .padding(.top, 20)
                        Spacer()
                        Text("\(getDateFormat(date: boast.date))")
                            .font(.bodyEmphasized)
                            .frame(width: 281, alignment: .leading)
                            .padding(.bottom, 22)
                    }
                    
                    if images.count == 1 {
                        images[0]
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 281, height: 220)
                            .clipped()
                            .cornerRadius(8)
                            .padding(.top, 20)
                        
                        Text("\(boast.contents)")
                            .font(.bodyRegular)
                            .frame(width: 281, height: 152, alignment: .topLeading)
                            .padding(.vertical, 22)
                        
                        Text("\(getDateFormat(date: boast.date))")
                            .font(.bodyEmphasized)
                            .frame(width: 281, alignment: .leading)
                        Spacer()
                    }
                    
                    if images.count == 2 {
                        HStack(spacing: 0){
                            images[0]
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 136, height: 220)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.top, 20)
                                .padding(.horizontal, 5)
                            
                            images[1]
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 136, height: 220)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.top, 20)
                                .padding(.horizontal, 5)
                            
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
            }
            .frame(width: 329, height: 480)
        }
    }
}

