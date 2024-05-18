//
//  ContentView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding(.bottom, 1)
                NavigationLink(destination: AwardDetailView()){
                    Text("상장 박물관 메인")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
