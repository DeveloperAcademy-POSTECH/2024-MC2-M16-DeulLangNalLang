import SwiftUI

struct BoastMainView: View {
    @State private var showSheet: Bool = false
    
    @State var tempBoasts = [
        Boast(contents: "동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세 동해물과 백두산이", date: Date()),
        Boast(contents: "오늘은 날씨가 참 맑고 따뜻한 하루였습니다. 친구들과 함께 공원에 가서 산책을 하고, 벤치에 앉아 이야기를 나누며 시간을 보냈습니다. 바람이 살랑살랑 불어와 기분이 아주 좋았습니다.", date: Date()),
        Boast(contents: "저녁이 되자 해가 지면서 하늘이 붉게 물들었고, 우리는 그 광경을 바라보며 하루를 마무리했습니다." , date: Date())]
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Menu {
                    Button("산이만 보기", action:{})
                    Button("들이만 보기", action:{})
                    Button("전체보기", action:{})
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .foregroundStyle(.black)
                        .font(.title1Regular)
                }
                .padding(.trailing, 4)
                
                Button(action: {
                    showSheet.toggle()
                    //TODO: 상장 작성 view 연결
                }) {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                        .font(.title1Regular)
                }
                .sheet(isPresented: $showSheet) {
                    Text("hi")
                }
            }
            .padding(.trailing)
            .padding(.vertical, 4)
            
            ScrollView{
                ForEach($tempBoasts, id: \.self) { boast in
                    BoastCardView(tempBoast: boast)
                        .padding(.bottom, 8)
                }
            }
            .padding()
        }
    }
}

#Preview {
    BoastMainView()
}
