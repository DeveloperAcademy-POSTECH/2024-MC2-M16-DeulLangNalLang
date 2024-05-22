import SwiftUI
import SwiftData

struct BoastMainView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var showSheet: Bool = false
    @State var showingBoasts: [Boast] = []
    
    @Query var boasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil })
    var bothBoasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil && $0.writer == "류산" })
    var onlySanBoasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil && $0.writer == "류들" })
    var onlyDeulBoasts: [Boast]
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Menu {
                    Button("산이만 보기", action:{
                        self.showingBoasts = onlySanBoasts
                    })
                    Button("들이만 보기", action:{
                        self.showingBoasts = onlyDeulBoasts
                    })
                    Button("전체보기", action:{
                        self.showingBoasts = bothBoasts
                    })
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .foregroundStyle(.black)
                        .font(.title1Regular)
                }
                .padding(.trailing, 4)
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                        .font(.title1Regular)
                }
                .sheet(isPresented: $showSheet) {
                    BoastAddView()
                }
            }
            .padding(.trailing)
            .padding(.vertical, 4)
            
            ScrollView{
                ForEach($showingBoasts) { boast in
                    BoastCardView(boast: boast, onDelete: {
                        if let index = showingBoasts.firstIndex(of: boast.wrappedValue) {
                            showingBoasts.remove(at: index)
                        }
                    })
                    .padding(.bottom, 8)
                }
            }
            .padding()
        }
        .onAppear {
            self.showingBoasts = boasts
        }
    }
}

#Preview {
    BoastMainView()
}
