import SwiftUI
struct AwardEmptyView: View {
    
    var body: some View {
        
        ZStack {
            // 배경 색상 설정
            Color.DNBackground
                .edgesIgnoringSafeArea(.all)
            
            Spacer().frame(height: 200)
            
            Image("EmptyViewImage")
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
