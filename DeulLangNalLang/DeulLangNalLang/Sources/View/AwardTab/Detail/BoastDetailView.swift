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
    var boast: Boast
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 329, height: 480)
                    .foregroundColor(.blue)
                VStack(spacing: 0){
                    //---------- 사진 1장일 때--------------
//                    Image("선인장")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 281, height: 220)
//                        .clipped()
//                        .cornerRadius(8)
//                        .padding(.top, 20)
                    
                    //---------- 사진 2장일 때--------------
//                    HStack(spacing: 0){
//                        Image("선인장")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 136, height: 220)
//                            .clipped()
//                            .cornerRadius(8)
//                            .padding(.top, 20)
//                            .padding(.horizontal, 5)
//
//                        Image("선인장")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 136, height: 220)
//                            .clipped()
//                            .cornerRadius(8)
//                            .padding(.top, 20)
//                            .padding(.horizontal, 5)
//
//                    }
                    
                    Text("\(boast.contents)")
                        .font(.bodyRegular)
                        .frame(width: 281, height: 152, alignment: .topLeading)
                        .padding(.vertical, 22)
                    Text("\(boast.date)")
                        .font(.bodyEmphasized)
                        .frame(width: 281, alignment: .leading)
                }
            }
            .frame(width: 329, height: 480)
            .padding(.bottom, 59)
        }
    }
}

