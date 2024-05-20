//
//  AwardAddView.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/19/24.
//

import SwiftUI

//Editable TextEditor
struct CustomTextEditor: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        textView.delegate = context.coordinator
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTextEditor
        
        init(_ parent: CustomTextEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}


struct AwardAddView: View {
    
    @State private var showModal = false
    
    static let labelsTeritory: Color = Color(red: 0.24, green: 0.24, blue: 0.26)
    
    var body: some View {
        
        Button(action: {
            self.showModal = true
        }){Text("Hello").bold()
        }
        .sheet(isPresented: self.$showModal) {
            ModalView()
        }
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    @State var awardTitle: String = ""
    @State var awardContents: String = ""
    
    
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
                
                VStack {
                    TextField("제목을 입력하세요", text: $awardTitle)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(12)
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
            
            /////////////////// 여기 문제있음 ////////////////////////////////////////////////////////////////////////////////////////////////////////
            if awardContents == "" {
                ZStack{
                    Text("상장 내용을 입력하세요")
                        .foregroundColor(.black)
                    
                    CustomTextEditor(text: $awardContents)
                        .frame(height: 138)
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal, 16)
                    
                }
            } else {CustomTextEditor(text: $awardContents)
                    .frame(height: 138)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(12)
                .padding(.horizontal, 16)}
            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            //row 3 - AwardFrame
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: .infinity, height: 24)
            
            Text("상장 프레임")
                .font(.headlineEmphasized)
                .foregroundColor(.black)
                .frame(width: 361, alignment: .topLeading)
            
            //            Rectangle()
            //                .frame(width: .infinity, height: 8)
            //                .foregroundColor(.clear)
            
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    Button(action: {
                        //code
                    }){
                        Rectangle()
                            .frame(width: 72, height: 72)
                            .cornerRadius(8.0)
                    }
                    Button(action: {
                        //code
                    }){
                        Rectangle()
                            .frame(width: 72, height: 72)
                            .cornerRadius(8.0)
                    }
                    Button(action: {
                        //code
                    }){
                        Rectangle()
                            .frame(width: 72, height: 72)
                            .cornerRadius(8.0)
                    }
                    Button(action: {
                        //code
                    }){
                        Rectangle()
                            .frame(width: 72, height: 72)
                            .cornerRadius(8.0)
                    }
                    Button(action: {
                        //code
                    }){
                        Rectangle()
                            .frame(width: 72, height: 72)
                            .cornerRadius(8.0)
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


