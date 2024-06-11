//
//  BoastMainView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/21/24.
//

import SwiftUI
import SwiftData

struct BoastMainView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var isBoastAddViewShown: Bool = false
    @State var showingBoasts: [Boast] = []
    
    @Query(filter: #Predicate<Boast> { $0.award == nil })
    var bothBoasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil && $0.writer == "류산" })
    var onlySanBoasts: [Boast]
    
    @Query(filter: #Predicate<Boast> { $0.award == nil && $0.writer == "류들" })
    var onlyDeulBoasts: [Boast]
    
    @State var mode: BoastCategory = .both
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack{
                if bothBoasts.isEmpty{
                    BoastEmptyView(onDismiss: updateShowingBoasts)
                }
                else {
                    VStack {
                        Picker(selection: $mode, label: Text("Picker")) {
                            Text("전체보기").tag(BoastCategory.both)
                                .font(.title1Regular)
                            Text("산 자랑").tag(BoastCategory.onlySan)
                                .font(.title1Regular)
                            Text("들 자랑").tag(BoastCategory.onlyDeul)
                                .font(.title1Regular)
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: mode) {
                            updateShowingBoasts()
                        }
                        
                        ScrollView{
                            Spacer().frame(height: 10)
                            VStack(spacing: 0) {
                                ForEach($showingBoasts) { boast in
                                    BoastCardView(boast: boast, onDelete: {
                                        if let index = showingBoasts.firstIndex(of: boast.wrappedValue) {
                                            showingBoasts.remove(at: index)
                                        }
                                    }, onUpdate: {
                                        updateShowingBoasts()
                                    })
                                    .padding(.bottom, 16)
                                }
                            }
                            .padding(.horizontal, 12)
                        }
                        .scrollIndicators(.hidden)
                    }
                }
            }
            .background(Color.DNBackground)
            .onAppear {
                updateShowingBoasts()
            }
            
            //MARK: 자랑 작성 버튼
            Button(action: {
                self.isBoastAddViewShown.toggle()
            }, label: {
                HStack(spacing: 0){
                    Image(systemName: "pencil.line")
                        .padding(.trailing, 10)
                    Text("자랑작성")
                }
                .font(.title3Regular).fontWeight(.semibold)
                .frame(width: 148, height: 58)
                .background(Color.yellow)
                .foregroundColor(Color(hex: "#472200"))
                .clipShape(Capsule())
            })
            .fullScreenCover(isPresented: $isBoastAddViewShown, onDismiss: {
                updateShowingBoasts()
            }) {
                BoastAddView(isBoastAddViewShown: $isBoastAddViewShown)
            }
            .padding(.bottom, 22)
            .padding(.trailing, 16)
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
