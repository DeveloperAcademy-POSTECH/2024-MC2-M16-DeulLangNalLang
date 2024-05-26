//
//  AwardAddView.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/19/24.

import SwiftUI

struct AwardAddView: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.modelContext) var modelContext
    
    @State var awardTitle: String = ""
    @State var awardContents: String = ""
    @State var placeholderText: String = "상장 내용을 입력해 주세요"
    @State var titleCharacterCount: Int = 0
    @State var contentsCharacterCount: Int = 0
    @State private var selectedFrameIndex: Int? = nil
    
    var onDelete: () -> Void
    
    let awardImages = ["Octopus", "Origami", "Cactus","Bicycle", "Gem"]
    
    @Binding var boast: Boast
    
    var body: some View {
        
        VStack {
            //grabber
            VStack(alignment: .center, spacing: 8) {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 36, height: 5)
                    .background(Color(red: 0.24, green: 0.24, blue: 0.26)
                        .opacity(0.3))
                    .cornerRadius(2.5)
            }
            .padding(.bottom, 4)
            .padding(.top, 5)
            .frame(maxWidth: .infinity, alignment: .top)
            
            //NavigationBar
            HStack{
                Rectangle()
                    .frame(width: 48, height: 44)
                    .foregroundColor(.clear)
                
                Spacer()
                
                Text("상장 쓰기")
                    .font(.headlineEmphasized)
                    .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                    boast.award = Award(title: self.awardTitle,
                                        contents: self.awardContents,
                                        date: Date(),
                                        isFavorite: false,
                                        themeName: awardImages[selectedFrameIndex ?? 0])
                    onDelete()
                }) {
                    Text("완료")
                        .font(.bodyRegular)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.blue)
                        .padding(.trailing, 16)
                        .padding(.vertical, 11)
                }
            }
            .padding(.bottom, 24)
            
            //Contents - AwardWrite
            //row 1 - AwardTitle
            Text("상장 제목")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            HStack(spacing: 8){
                ZStack {
                    VStack {
                        TextField("제목을 입력하세요", text: $awardTitle)
                            .onChange(of: awardTitle) {
                                if awardTitle.count <= 7 {
                                    titleCharacterCount = awardTitle.count
                                } else {
                                    awardTitle = String(awardTitle.prefix(8))
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.black, lineWidth: 1)
                            )
                    }
                    HStack {
                        Spacer()
                        Text("\(titleCharacterCount)/7")
                            .font(.footnoteRegular)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                }
                
                Text("상")
                    .font(.bodyRegular)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            
            //row 2 - AwardContents
            Text("상장 내용")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            ZStack(alignment: .topLeading) {
                ZStack {
                    if self.awardContents.isEmpty {
                        TextEditor(text:$placeholderText)
                            .font(.bodyRegular)
                            .foregroundColor(.gray)
                            .disabled(true)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.black, lineWidth: 1)
                                    .background(.clear))
                            .frame(height: 100)
                    }
                    TextEditor(text: $awardContents)
                        .font(.body)
                        .opacity(self.awardContents.isEmpty ? 0.25 : 1)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.black, lineWidth: 1)
                                .background(.clear))
                        .frame(height: 100)
                        .onChange(of: awardContents) {
                            if awardContents.count <= 90 {
                                contentsCharacterCount = awardContents.count
                            } else {
                                awardContents = String(awardContents.prefix(90))
                            }
                        }
                }
                
                VStack {
                    Rectangle()
                        .frame(height: 56)
                        .foregroundColor(.clear)
                    HStack {
                        Spacer()
                        Text("\(contentsCharacterCount)/90")
                            .font(.footnoteRegular)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            
            //row 3 - AwardFrame
            Text("상장 프레임")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<awardImages.count, id: \.self) { index in
                        Button(action: {
                            selectedFrameIndex = index
                        }) {
                            Image.award(themeName: awardImages[index])
                                .frame(width: 72, height: 72)
                                .scaledToFill()
                                .cornerRadius(8.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedFrameIndex == index ? .blue : .clear, lineWidth: 2)
                                )
                        }
                    }
                }
                .frame(maxHeight: 85)
                .padding(.horizontal, 16)
            }
        }
        Spacer()
    }
}
