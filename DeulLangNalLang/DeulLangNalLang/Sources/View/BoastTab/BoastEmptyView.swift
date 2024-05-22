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
            
            Image("EmptyViewimage")
              .frame(width: 32, height: 64)
              .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
             
            Spacer().frame(height: 18)
            
            // Title2/KR_Emphasized
            Text("자랑 하나 주면 안잡아먹지!")

                .font(.title2Emphasized)
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 361, height: 28, alignment: .top)
            
            Spacer().frame(height: 2)
            
            Text("나의 첫 번째 자랑을\n작성해보세요.")
                     .font(.bodyRegular)
                     .multilineTextAlignment(.center)
                     .foregroundColor(.black)

            .frame(width: 361, height: 48, alignment: .top)

            Spacer().frame(height: 195)
            
            
            

            
            //MARK: 자랑하러 가기 버튼
            Button(action: {
                showSheet.toggle()
            }) {

                HStack(alignment: .center, spacing: 4) {Text("자랑하러 가기")}
                .padding(.horizontal, 14)
                .padding(.vertical, 7)
                .foregroundColor(.white)
                .background(Color(red: 0.31, green: 0.75, blue: 1))
                .cornerRadius(40)

            }
            .sheet(isPresented: $showSheet) {
                BoastAddView()
            }
            
//            Spacer().frame(height: 32)
            
        }
    }
}

#Preview {
    BoastEmptyView()
}
