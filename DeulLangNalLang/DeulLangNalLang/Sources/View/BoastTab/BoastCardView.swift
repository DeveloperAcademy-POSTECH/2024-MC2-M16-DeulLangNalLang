import SwiftUI

struct BoastCardView: View {
    @Binding var tempBoast: Boast
    
    @State private var Username = "San"
    @State private var images: [String] = [
        "https://i.pinimg.com/564x/1e/a8/1f/1ea81fe0ddc6b0dbd76899c7aebfb47c.jpg",
        "https://i.pinimg.com/564x/8a/be/9b/8abe9b3640dbef426f6c9c9a67457e9d.jpg"
    ]
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            //MARK: image 부분
            if images.count == 1 {
                AsyncImage(url: URL(string: images[0])) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .frame(height: 180)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            if images.count == 2 {
                HStack {
                    AsyncImage(url: URL(string: images[0])) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(height: 180)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    AsyncImage(url: URL(string: images[1])) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(height: 180)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            
            //MARK: text 부분
            VStack(alignment: .leading){
                ExpandableText(tempBoast.contents, lineLimit: 3)
                    .font(.bodyRegular)
                    .foregroundStyle(.white)
            }
            
            //MARK: 하단 날짜 + 버튼 부분
            Divider()
            VStack{
                HStack{
                    Text("2024.00.00")
                        .font(.bodyRegular)
                        .foregroundStyle(.white)
                    Spacer()
                    /// 본인일 때 (내가 쓴 글) 수정하기 버튼
                    if Username == "Deul" {
                        Menu {
                            Button("수정하기", action:{})
                            Button(role: .destructive, action:{}) {
                                Label("삭제하기", systemImage: "trash")
                            }
                            .foregroundColor(.red)
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.white)
                        }
                    }
                    /// 상대일 때 상장주기 버튼
                    if Username == "San"  {
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
                            AwardAddView()
                        }
                    }
                }
            }
            .padding(.vertical, 0)
        }
        .padding(12)
        .frame(width: 361) //나중에 보면서 삭제하기
        //                .frame(height: 324)
        .background(Username == "Deul" ? Color.DNGreen : Color.DNBlue)
        .cornerRadius(16)
    }
}



//#Preview {
//    BoastCardView()
//}