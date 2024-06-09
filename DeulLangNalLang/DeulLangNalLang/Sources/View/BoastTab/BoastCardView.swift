//
//  BoastCardView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/21/24.
//

import SwiftUI
import SwiftData

struct BoastCardView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Environment(User.self) var user: User
    
    @Query var boasts: [Boast]
    
    @State private var isBoastEditViewShown: Bool = false
    @State private var showActionSheet: Bool = false
    
    @Binding var boast: Boast
    
    var onDelete: () -> Void
    var onUpdate: () -> Void
    
    var body: some View {
        VStack {
            //MARK: image 부분
            ForEach(boast.imageDatas, id: \.self) { data in
                if let image = UIImage(data: data){
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                        .allowsHitTesting(false)
                }
            }
            
            //MARK: text 부분
            VStack {
                ExpandableText(boast.contents, lineLimit: 3)
                    .font(.bodyRegular)
            }
            .padding(.vertical, 2)
            
            //MARK: 하단 날짜 + 버튼 부분
            Divider()
            
            VStack{
                HStack{
                    Text(boast.date.getFormattedString())
                        .font(.footnoteEmphasized)
                    Spacer()
                    
                    /// 본인일 때 (내가 쓴 글) 수정하기 버튼
                    if boast.writer == user.name {
                        Menu {
                            Button("수정하기", action:{
                                isBoastEditViewShown.toggle()
                            })
                            Button(role: .destructive, action:{
                                showActionSheet.toggle()
                            }) {
                                Label("삭제하기", systemImage: "trash")
                            }
                            .foregroundColor(.red)
                        } label: {
                            Image.threeDot
                                .foregroundStyle(.black)
                                .frame(width: 30, height: 30)
                        }
                        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
                        .sheet(isPresented: $isBoastEditViewShown, onDismiss: {
                            onUpdate()
                        }) {
                            BoastEditView(isBoastEditViewShown: $isBoastEditViewShown, boastID: $boast.id)
                        }
                    }
                    
                    /// 상대일 때 상장주기 버튼
                    if boast.writer != user.name  {
                        Button(action: {
                            isBoastEditViewShown.toggle()
                        }) {
                            Text("상장주기")
                                .font(.subheadlineEmphasized)
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .frame(width: 72, height: 28)
                        .background(Color.black)
                        .cornerRadius(14)
                        .sheet(isPresented: $isBoastEditViewShown) {
                            AwardAddView(onDelete: onDelete, boast: $boast)
                        }
                    }
                }
                .padding(.vertical, 2)
            }
        }
        .padding(12)
        .background(boast.writer == "류들" ? Color.DNGreen : Color.DNBlue)
        .cornerRadius(16)
    }
    
    //MARK: ActionSheet 동작 함수
    func getActionSheet() -> ActionSheet {
        
        let title = Text("정말로 삭제하실 건가요?")
        let message = Text("이 작업은 취소할 수 없습니다.")
        
        let deleteButton: ActionSheet.Button = .destructive(Text("삭제")) {
            modelContext.delete(boast)
            try? modelContext.save()
            self.onDelete()
        }
        let cancelButton: ActionSheet.Button = .cancel(Text("취소"))
        
        return ActionSheet(title: title,
                           message: message,
                           buttons: [deleteButton, cancelButton])
    }
    
    //MARK: ImageLoad 함수
    //TODO: 추후 이미지 데이터를 불러오면 삭제 예정
    private func loadImage(urlString: String) -> some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
        } placeholder: {
            Color.secondary
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
        }
    }
    
    //MARK: 3줄 이상일 때 클릭 시 텍스트 확장
    struct ExpandableText: View {
        @State private var expanded: Bool = false
        @State private var truncated: Bool = false
        private var text: String
        
        let lineLimit: Int
        
        init(_ text: String, lineLimit: Int) {
            self.text = text
            self.lineLimit = lineLimit
        }

        var body: some View {
            VStack(alignment: .leading) {
                Text(text)
                    .lineLimit(expanded ? nil : lineLimit)
                    .background(
                        Text(text).lineLimit(lineLimit)
                            .background(GeometryReader { visibleTextGeometry in
                                ZStack {
                                    Text(self.text)
                                        .background(GeometryReader { fullTextGeometry in
                                            Color.clear.onAppear {
                                                self.truncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                            }
                                        })
                                }
                                .frame(height: .greatestFiniteMagnitude)
                            })
                            .hidden()
                    )
                    .onTapGesture {
                        withAnimation {
                            expanded.toggle()
                        }
                    }
                
            }
        }
    }
}

//#Preview {
//    BoastCardView()
//}
