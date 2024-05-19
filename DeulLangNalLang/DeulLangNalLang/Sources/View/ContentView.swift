//
//  ContentView.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    
    
    var body: some View {
        NavigationStack{
            
            VStack(spacing: 0){
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
            Button("Show Modal") {
                showModal = true
                //                            Text("자랑 추가")
                //                                .foregroundColor(.black)
                //                                .fontWeight(.heavy)
                
            }
            .sheet(isPresented: $showModal) {
                BoastAddView()
            }
        }
    }
}

#Preview {
    ContentView()
}
