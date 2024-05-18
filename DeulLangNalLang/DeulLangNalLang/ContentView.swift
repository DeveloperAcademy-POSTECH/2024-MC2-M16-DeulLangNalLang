//
//  ContentView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
<<<<<<< dd68db4aef2f7d7fb947626b24c5f637638155fd
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("PRTest")
=======
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
>>>>>>> feat: 상단 툴바
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
