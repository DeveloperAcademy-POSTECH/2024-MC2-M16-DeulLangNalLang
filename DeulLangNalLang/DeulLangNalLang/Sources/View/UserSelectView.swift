//
//  UserSelectView.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/19/24.
//

import SwiftUI

struct UserSelectView: View {
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
    UserSelectView()
}
