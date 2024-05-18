//
//  AwardDetailView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI

struct AwardDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        CardFlipView()
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: backButton)
    }
    
    /// Custom Back Button
    var backButton: some View {
        Button {
            self.dismiss()
        } label: {
            HStack(spacing: 3) {
                Image(systemName: "chevron.left")
                Text("상장 박물관")
            }
        }
    }
    
}

#Preview {
    AwardDetailView()
}
