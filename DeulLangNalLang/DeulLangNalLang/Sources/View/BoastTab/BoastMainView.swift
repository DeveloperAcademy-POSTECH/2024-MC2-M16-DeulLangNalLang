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
        VStack {
            if showingBoasts.isEmpty {
                BoastEmptyView(onDismiss: updateShowingBoasts)
            }
            else {
                VStack {
                    HStack{
                        Spacer()
                        Menu {
                            Button("산이만 보기") {
                                self.mode = .onlySan
                                updateShowingBoasts()
                            }
                            Button("들이만 보기") {
                                self.mode = .onlyDeul
                                updateShowingBoasts()
                            }
                            Button("전체보기") {
                                self.mode = .both
                                updateShowingBoasts()
                            }
                        } label: {
                            Image.filteringButton
                                .foregroundStyle(.black)
                                .font(.title1Regular)
                        }
                        .padding(.trailing, 12)
                        
                        Button(action: {
                            isBoastAddViewShown.toggle()
                        }) {
                            Image.plusButton
                                .foregroundStyle(.black)
                                .font(.title1Regular)
                        }
                        .fullScreenCover(isPresented: $isBoastAddViewShown, onDismiss: {
                            updateShowingBoasts()
                        }) {
                            BoastAddView(isBoastAddViewShown: $isBoastAddViewShown)
                        }
                    }
                    .padding(.trailing, 14)
                    .padding(.bottom, 10)
                    
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
                .background(Color.DNBackground)
            }
        }
        .onAppear {
            updateShowingBoasts()
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
