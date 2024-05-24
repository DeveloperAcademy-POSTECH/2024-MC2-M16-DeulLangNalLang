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
    
    @State var mode: BoastCategory = .both
    
    var body: some View {
        if boasts.isEmpty {
            BoastEmptyView()
        }
        else {
            TrackableScrollView(header: {
                ScrollView{
                    HStack {
                        Spacer()
                        Menu {
                            Button("산이만 보기", action:{
                                self.mode = .onlySan
                                updateShowingBoasts()
                            })
                            Button("들이만 보기", action:{
                                self.mode = .onlyDeul
                                updateShowingBoasts()
                            })
                            Button("전체보기", action:{
                                self.mode = .both
                                updateShowingBoasts()
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
                        .sheet(isPresented: $showSheet, onDismiss: {
                            updateShowingBoasts()
                        }) {
                            BoastAddView()
                        }
                    }
                    .background(Color.DNBackground)
                    .padding(.trailing, 12)
                }
                .padding()
            }, content: {
                VStack(spacing: 0) {
                    ForEach($showingBoasts) { boast in
                        BoastCardView(boast: boast, onDelete: {
                            if let index = showingBoasts.firstIndex(of: boast.wrappedValue) {
                                showingBoasts.remove(at: index)
                            }
                        })
                        .padding(.bottom, 16)
                    }
                }
                .onAppear {
                    updateShowingBoasts()
                }
            })
            .backgroundStyle(Color.DNBackground)
        }
        
    }
    
    
    
    
    struct TrackableScrollView<Header: View, Content: View>: View {
        @State private var showHeader = true
        @Query var boasts: [Boast]
        
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
    
    private func updateShowingBoasts() {
        switch mode {
        case .both:
            showingBoasts = bothBoasts
        case .onlyDeul:
            showingBoasts = onlyDeulBoasts
        case .onlySan:
            showingBoasts = onlySanBoasts
        }
    }
}

enum BoastCategory {
    case both
    case onlyDeul
    case onlySan
}

#Preview {
    BoastMainView()
}
