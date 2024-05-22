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
        TrackableScrollView(header: {
            ScrollView{
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
                    .padding(.trailing, 12)
                    
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
                .background(.white)
                .padding(.trailing, 12)
            }
            .padding()
        }, content: {
            VStack(spacing: 0){
                ForEach($showingBoasts) { boast in
                    BoastCardView(boast: boast, onDelete: {
                        if let index = showingBoasts.firstIndex(of: boast.wrappedValue) {
                            showingBoasts.remove(at: index)
                        }
                    })
                    .padding(.bottom, 16)
                }
            }
        })
    }
    
    struct TrackableScrollView<Header: View, Content: View>: View {
        @State private var showHeader = true
        
        let header: () -> Header
        let content: () -> Content
        
        var body: some View {
            VStack(spacing :0){
                if showHeader {
                    VStack(spacing :0){
                        header()
                            .frame(height: 60)
                    }
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .top),
                            removal: .push(from: .bottom)
                        )
                    )
                    .padding(.top, -12)
                }
                
                GeometryReader { outerGeo in
                    let outerHeight = outerGeo.size.height
                    ScrollView(.vertical) {
                        content()
                            .background {
                                GeometryReader { innnerGeo in
                                    let contentHeight = innnerGeo.size.height
                                    let minY = max(
                                        min(0, innnerGeo.frame(in: .named("ScrollView")).minY),
                                        outerHeight - contentHeight
                                    )
                                    Color.clear
                                        .onChange(of: minY) { oldVal, newVal in
                                            if (showHeader && newVal < oldVal) || !showHeader && newVal > oldVal {
                                                showHeader = newVal > oldVal
                                            }
                                        }
                                }
                            }
                    }
                    .coordinateSpace(name: "ScrollView")
                    .padding(.horizontal)
                }
                .padding(.top, 1)
            }
            .animation(.easeInOut, value: showHeader)
        }
    }
}

#Preview {
    BoastMainView()
}
