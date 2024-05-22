import SwiftUI
struct AwardEmptyView: View {

    var body: some View {
        VStack {
            Text("상장이 아직 모이지\n않았어요를레히호")
                .font(.title1Emphasized)
              .foregroundColor(.black)
              .frame(width: 361, alignment: .topLeading)
            
            Spacer().frame(height: 173)
            
            
              
            
            
            
            Image("EmptyViewimage")
              .frame(width: 37, height: 63.6444)
              .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            
            // Title2/KR_Emphasized
            Text("들랑날랑 시작하기")
                .font(.title2Emphasized)
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 361, height: 28, alignment: .top)
            
            Spacer().frame(height: 2)
            
            Text("자랑을 작성하고 \n상장을 모아보세요.")
                     .font(.bodyRegular)
                     .multilineTextAlignment(.center)
                     .foregroundColor(.black)

            Text("자랑을 하고 상장을 모아보세요!")
                .font(.bodyRegular)
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
