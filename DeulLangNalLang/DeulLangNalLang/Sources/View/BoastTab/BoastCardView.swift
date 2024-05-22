import SwiftUI
import SwiftData

struct BoastCardView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Environment(User.self) var user: User
    
    @Query var boasts: [Boast]
    
    @State private var showSheet: Bool = false
    @State private var showActionSheet: Bool = false
    
    @Binding var boast: Boast
    var onDelete: () -> Void
    
    var body: some View {
        VStack {
            //MARK: image 부분
            ForEach(boast.imageDatas, id: \.self) { data in
                if let image = UIImage(data: data){
                    Image(uiImage: image)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                }
            }
            
            //MARK: text 부분
            VStack(alignment: .leading){
                ExpandableText(boast.contents, lineLimit: 3)
                    .font(.bodyRegular)
                    .foregroundStyle(.white)
            }
            
            //MARK: 하단 날짜 + 버튼 부분
            Divider()
            VStack{
                HStack{
                    Text(getDateFormat(date: boast.date))
                        .font(.bodyRegular)
                        .foregroundStyle(.white)
                    Spacer()
                    
                    /// 본인일 때 (내가 쓴 글) 수정하기 버튼
                    if boast.writer == user.name {
                        Menu {
                            Button("수정하기", action:{})
                            Button(role: .destructive, action:{
                                showActionSheet.toggle()
                            }) {
                                Label("삭제하기", systemImage: "trash")
                            }
                            .foregroundColor(.red)
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.white)
                        }
                        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
                    }
                    
                    /// 상대일 때 상장주기 버튼
                    if boast.writer != user.name  {
                        Button(action: {
                            showSheet.toggle()
                        }) {
                            Text("상장주기")
                                .font(.subheadlineEmphasized)
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .frame(width: 72, height: 28)
                        .background(Color.black)
                        .cornerRadius(14)
                        .sheet(isPresented: $showSheet) {
                            AwardAddView(onDelete: onDelete, boast: $boast)
                        }
                    }
                }
            }
            .padding(.vertical, 0)
        }
        .padding(12)
        .frame(width: 361) //나중에 보면서 삭제하기
        //                .frame(height: 324)
        .background(boast.writer == "류들" ? Color.DNGreen : Color.DNBlue)
        .cornerRadius(16)
    }
    
    //MARK: ActionSheet 동작 함수
    func getActionSheet() -> ActionSheet {
        
        let title = Text("정말로 삭제하실 건가요?")
        let message = Text("이 작업은 취소할 수 없습니다.")
        
        let deleteButton: ActionSheet.Button = .destructive(Text("삭제")) {
            modelContext.delete(boast)
            self.onDelete()
        }
        let cancelButton: ActionSheet.Button = .cancel(Text("취소"))
        
        return ActionSheet(title: title,
                           message: message,
                           buttons: [deleteButton, cancelButton])
    }
}

//#Preview {
//    BoastCardView()
//}
