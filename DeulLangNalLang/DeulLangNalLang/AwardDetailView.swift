//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by  SAN RYU on 5/18/24.
//

import SwiftUI

struct AwardDetailView: View {
        @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack {
                Text("상장 상세 보기")
            }
            .navigationTitle("상장과 자랑 보기")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("상장 박물관")
                        }
                    }
                }
            }
        }
}

#Preview {
    AwardDetailView()
}
