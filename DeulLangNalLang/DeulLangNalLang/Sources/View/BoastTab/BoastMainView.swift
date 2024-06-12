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
    
    // segmented control 폰트 크기 조정
     init() {
         UISegmentedControl.appearance().setTitleTextAttributes([.font : UIFont.preferredFont(forTextStyle: .callout)], for: .normal)
     }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack(spacing: 0){
                if bothBoasts.isEmpty{
                    BoastEmptyView(onDismiss: updateShowingBoasts)
                }
                else {
                    VStack(spacing: 0){
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
                        .frame(height: 46)
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
                        }
                        .scrollIndicators(.hidden)
                    }
                }
            }
            .padding(.horizontal, 16)
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

// segmented control height 조정
extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}

#Preview {
    BoastMainView()
}
