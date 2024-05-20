//
//  TotalAwardsListView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct TotalAwardListView: View {
    
    //목록을 1부터 100까지 만듬
    let data = Array(1...100).map { "목록 \($0)"}
    
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
        //GridItem(.adaptive(minimum:100)->레이아웃의 최소 사이즈를 100으로 정해서 화면을 그리드 형식으로 꽉 차게 만듦.
    ]
    
    var body: some View {
   
            VStack(alignment: .leading){
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.self) { award in
                        
                        VStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.yellow)
                                .frame(height: 115)
                            
                            Text(award)
                                .font(.headlineEmphasized)
                        }
                    }
                }
            }
        }
    }

#Preview {
    TotalAwardListView()
}
