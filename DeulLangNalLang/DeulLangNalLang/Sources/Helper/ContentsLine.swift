import SwiftUI

//MARK: 3줄 이상일 때 클릭 시 텍스트 확장
struct ExpandableText: View {
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    private var text: String
    
    let lineLimit: Int
    
    init(_ text: String, lineLimit: Int) {
        self.text = text
        self.lineLimit = lineLimit
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .background(
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { visibleTextGeometry in
                            ZStack {
                                Text(self.text)
                                    .background(GeometryReader { fullTextGeometry in
                                        Color.clear.onAppear {
                                            self.truncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden()
                )
                .onTapGesture {
                    withAnimation {
                        expanded.toggle()
                    }
                }
            
        }
    }
}

//MARK: 글자 단위로 줄바꿈
extension String{
    func splitCharacter() -> String{
        return self.split(separator: "").joined(separator: "\u{200B}")
    }
}

//MARK: DateFormatting
func getDateFormat(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    
    let dateString = formatter.string(from: date)
    return dateString
}
