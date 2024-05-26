import SwiftUI
struct BoastEmptyView: View {
    var onDismiss: () -> Void
    @State private var isBoastAddViewShown: Bool = false
    
    var body: some View {
        ZStack {
            // 배경 색상 설정
            Color.DNBackground
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 130)
                
                Image("EmptyViewImage")
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
                
                Spacer().frame(height: 100)
                
                
                
                
                
                //MARK: 자랑하러 가기 버튼
                Button(action: {
                    isBoastAddViewShown.toggle()
                }) {
                    
                    HStack(alignment: .center, spacing: 4) {Text("자랑하러 가기")}
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .foregroundColor(.white)
                        .background(Color(red: 0.31, green: 0.75, blue: 1))
                        .cornerRadius(40)
                    
                }
                .sheet(isPresented: $isBoastAddViewShown, onDismiss: {
                    onDismiss()
                }) {
                    BoastAddView(isBoastAddViewShown: $isBoastAddViewShown)
                }
            }
        }
    }
}
