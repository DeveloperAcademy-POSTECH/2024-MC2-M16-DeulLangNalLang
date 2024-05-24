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
                .frame(width: 32, height: 56)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            
            Spacer().frame(height: 16)
            
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
                .frame(width: 361, height: 48, alignment: .top)
            
            Spacer().frame(height: 262)
        }
    }
}

#Preview {
    AwardEmptyView()
}
