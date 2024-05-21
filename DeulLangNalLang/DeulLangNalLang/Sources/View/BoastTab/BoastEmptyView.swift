import SwiftUI
struct BoastEmptyView: View {
@State private var showSheet: Bool = false
    var body: some View {
        VStack {
           
            Spacer().frame(height: 130)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 361, height: 242)
              .background(
                Image("EmpttyViewimage")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 361, height: 242)
                  .clipped()
              )
            
            Spacer().frame(height: 16)
            
            Text("자랑 하나 주면 안잡아먹지!")
            .font(Font.custom("Apple SD Gothic Neo", size: 16.5))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .frame(width: 361, height: 48, alignment: .top)

            Spacer().frame(height: 116)
            
            //MARK: 자랑하러 가기 버튼
            Button(action: {
                showSheet.toggle()
            }) {
                HStack(alignment: .center, spacing: 3.75)
                { Image(systemName: "play.fill")
                    Text("자랑하러 가기")
                    }
                .padding(.horizontal, 12.5)
                .padding(.vertical, 5)
                .background(Color(red: 0, green: 0.48, blue: 1).opacity(0.15))
                .cornerRadius(50)
            }
            .sheet(isPresented: $showSheet) {
                BoastAddView()
            }
        }
    }
}

#Preview {
    BoastEmptyView()
}
