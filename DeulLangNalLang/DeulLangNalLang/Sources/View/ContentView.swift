//
//  ContentView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var isDetailViewShown = false
    var body: some View {
        VStack {
            NavigationStack{
                NavigationLink(destination: AwardDetailView()){
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 110, height: 160)
                            .foregroundColor(.yellow)
                        VStack {
                            Text("상장")
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
