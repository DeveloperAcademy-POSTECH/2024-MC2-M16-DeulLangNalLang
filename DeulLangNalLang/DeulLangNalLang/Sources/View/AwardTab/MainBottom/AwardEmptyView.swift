import SwiftUI
struct AwardEmptyView: View {

    var body: some View {
        VStack {
            Text("상장이 아직 모이지\n않았어요를레히호")
              .font(
                Font.custom("SF Pro", size: 25)
                .weight(.bold)
              )
              .foregroundColor(.black)
              .frame(width: 361, alignment: .topLeading)
            
            Spacer().frame(height: 96)
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 361, height: 242)
              .background(
                Image("EmptyViewimage")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 361, height: 242)
                  .clipped()
              )
            
            Spacer().frame(height: 16)
            

            Text("자랑을 하고 상장을 모아보세요!")
            .font(Font.custom("Apple SD Gothic Neo", size: 16.5))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)

            .frame(width: 361, height: 48, alignment: .top)

            Spacer().frame(height: 177)
            
        
            
            
        }
    }
}

#Preview {
    AwardEmptyView()
}
