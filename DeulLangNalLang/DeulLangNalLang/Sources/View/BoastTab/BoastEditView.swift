//
//  BoastEditView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/21/24.
//

import SwiftUI
import UIKit
import SwiftData

struct BoastEditView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Environment(User.self) var user: User
    
    @Query var boasts: [Boast]
    
    @Binding var isBoastEditViewShown: Bool
    @Binding var boastID: UUID
    
    @State private var placeholder = "내용을 입력하세요"
    @State private var contentsText = ""
    @State private var selectedImageDatas: [Data] = []
    @State private var selectedImageData: Data?
    
    @State private var isShowingCamera = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    if self.contentsText.isEmpty {
                        TextEditor(text: $placeholder)
                            .font(.body)
                            .foregroundColor(.gray)
                            .disabled(true)
                            .padding()
                    }
                    TextEditor(text: $contentsText)
                        .font(.body)
                        .opacity(self.contentsText.isEmpty ? 0.25 : 1)
                        .padding()
                }
                
                HStack {
                    Spacer()
                    Text("\(contentsText.count)/100")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 5)
                }
                
                HStack(spacing: 8) {
                    ForEach(0..<selectedImageDatas.count, id: \.self) { index in
                        let data = selectedImageDatas[index]
                        if let image = UIImage(data: data) {
                            ZStack {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 177, height: 116)
                                    .clipped()
                                    .cornerRadius(16)
                                    .overlay(
                                        Button {
                                            selectedImageDatas.remove(at: index)
                                        } label: {
                                            Image.xButton
                                                .foregroundColor(.white)
                                                .background(Color.black.opacity(0.6))
                                                .clipShape(Circle())
                                        }
                                            .padding(5),
                                        alignment: .topTrailing
                                    )
                            }
                        }
                    }
                }
                Button {
                    isShowingCamera = true
                } label: {
                    Image.camera
                        .font(.title)
                        .padding()
                }
                .sheet(isPresented: $isShowingCamera) {
                    CameraView(selectedImageData: $selectedImageData, onDismiss: {
                        addImageData()
                    })
                }
                
            }
            .navigationBarTitle("자랑수정", displayMode: .inline)
            .navigationBarItems(trailing: Button("완료") {
                if contentsText != "" {
                    if let index = boasts.firstIndex(where: { $0.id == boastID }) {
                        boasts[index].contents = contentsText
                        boasts[index].imageDatas = selectedImageDatas
                        boasts[index].date = Date()
                        boasts[index].writer = user.name
                        do {
                            try modelContext.save()
                            self.isBoastEditViewShown = false
                        } catch {
                            print("Failed to save context: \(error)")
                        }
                    }
                }
            })
        }
        .onAppear{
            loadBoast()
        }
    }
    
    func addImageData() {
        guard let data = selectedImageData else { return }
        if selectedImageDatas.count >= 2 {
            selectedImageDatas.remove(at: 0)
        }
        selectedImageDatas.append(data)
    }
    
    //MARK: load할 때 기존 내용 넣어주기
    private func loadBoast() {
        if let index = boasts.firstIndex(where: { $0.id == boastID }) {
            contentsText = boasts[index].contents
            selectedImageDatas = boasts[index].imageDatas
        }
    }
}
