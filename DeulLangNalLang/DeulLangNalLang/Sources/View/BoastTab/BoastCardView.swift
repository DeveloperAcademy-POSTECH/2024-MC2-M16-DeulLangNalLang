import SwiftUI
import SwiftData

struct BoastCardView: View {
    @Environment(\.modelContext) var modelContext: ModelContext
    @Environment(User.self) var user: User
    
    @Query var boasts: [Boast]
    
    @State private var showSheet: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var showEditSheet = false
    
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
                    Text(getDateFormat(date: boast.date))
                        .font(.footnoteEmphasized)
                    Spacer()
                    
                    /// 본인일 때 (내가 쓴 글) 수정하기 버튼
                    if boast.writer == user.name {
                        Menu {
                            Button("수정하기", action:{
                                showEditSheet.toggle()
                            })
                            Button(role: .destructive, action:{
                                showActionSheet.toggle()
                            }) {
                                Label("삭제하기", systemImage: "trash")
                            }
                            .foregroundColor(.red)
                        } label: {
                            VStack{
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(.black)
                            }
                            .frame(width: 30)
                            .frame(maxHeight: .infinity)
                        }
                        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
                        .sheet(isPresented: $showEditSheet) {
                            BoastEditView(boastId: $boast.id)
                        }
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
}

//#Preview {
//    BoastCardView()
//}
