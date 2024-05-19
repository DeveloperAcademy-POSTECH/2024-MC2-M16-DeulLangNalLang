//
//  SegmentedPickerView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//
//
//import SwiftUI
//
//struct SegmentedPickerView: View {
//    let titles: [String]
//    @State var selectedIndex: Int?
//    
//    var body: some View {
//        
//        Picker(
//            titles,
//            selectedIndex: Binding(
//                get: { selectedIndex },
//                set: { selectedIndex = $0 }),
//            selectionAlignment: .bottom,
//            content: { item, isSelected in
//                Text(item)
//                    .foregroundColor(isSelected ? Color.black : Color.gray )
//                    .padding(.horizontal, 16)
//                    .padding(.vertical, 8)
//            },
//            selection: {
//                VStack(spacing: 0) {
//                    Spacer()
//                    Color.black.frame(height: 1)
//                }
//            })
//        .onAppear {
//            selectedIndex = 0
//        }
//        .animation(.easeInOut(duration: 0.3))
//    }
//}
//
//#Preview {
//    SegmentedPickerView()
//}
