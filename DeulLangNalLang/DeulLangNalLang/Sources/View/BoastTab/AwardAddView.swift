//
//  AwardAddView.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/19/24.

import SwiftUI

struct AwardAddView: View {
    
    @Environment(\.presentationMode) var presentation
    @State var awardTitle: String = ""
    @State var awardContents: String = ""
    @State var titleCharacterCount: Int = 0
    @State var contentsCharacterCount: Int = 0
    @State private var selectedFrameIndex: Int? = nil
    
    let awardImages = ["awardOctopus", "awardOrigami", "awardCactus","awardBicycle", "awardGem"]
    
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
                }) {
                    Text("완료")
                        .font(.bodyRegular)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.blue)
                        .padding(.trailing, 16)
                        .padding(.vertical, 11)
                }
                
            }
            
            //Contents - AwardWrite
            //row 1 - AwardTitle
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 24)
            
            Text("상장 제목")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            HStack{
                ZStack {
                    VStack {
                        TextField("제목을 입력하세요", text: $awardTitle)
                            .onChange(of: awardTitle) { newValue in
                                if newValue.count <= 8 {
                                    titleCharacterCount = newValue.count
                                } else {
                                    awardTitle = String(newValue.prefix(8))
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        
                    }
                    HStack {
                        Spacer()
                        Text("\(titleCharacterCount)/8")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                }
                
                Text("상")
                    .font(.bodyRegular)
                    .foregroundColor(.black)
                    .padding(.leading, 8)
            }
            .padding(.horizontal, 16)
            
            
            
            //row 2 - AwardContents
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 28)
            
            Text("상장 내용")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $awardContents)
                    .onChange(of: awardContents) { newValue in
                        if newValue.count <= 90 {
                            contentsCharacterCount = newValue.count
                        } else {
                            awardContents = String(newValue.prefix(90))
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(height: 100)
                    .foregroundColor(.black)
                //                    .onAppear {
                //                        UITextView.appearance().backgroundColor = .clear
                //                    }
                //                    .onChange(of: awardContents) { oldValue, newValue in
                //                        UITextView.appearance().backgroundColor = .clear
                //                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                
                if awardContents.isEmpty {
                    Text("상장 내용을 입력하세요")
                        .font(.bodyRegular)
                        .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.3))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 16)
                }
                
                VStack {
                    Rectangle()
                        .frame(height: 56)
                        .foregroundColor(.clear)
                    HStack {
                        Spacer()
                        Text("\(contentsCharacterCount)/90")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            
            
            //row 3 - AwardFrame
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 24)
            
            Text("상장 프레임")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<awardImages.count, id: \.self) { index in
                        Button(action: {
                            if selectedFrameIndex == index {
                                selectedFrameIndex = nil
                            } else {
                                selectedFrameIndex = index
                            }
                        }) {
                            Image(awardImages[index])
                                .frame(width: 72, height: 72)
                                .scaledToFill()
                                .cornerRadius(8.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(selectedFrameIndex == index ? Color.blue : Color.clear, lineWidth: 2)
                                )
                            //나중에 컬러 수정
                        }
                        .disabled(selectedFrameIndex != nil && selectedFrameIndex != index)
                    }
                }
                .frame(width: .infinity, height: 72)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
            }
        }
        Spacer()
    }
}

#Preview {
    AwardAddView()
}


