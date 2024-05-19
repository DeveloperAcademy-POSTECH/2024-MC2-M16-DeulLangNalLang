//
//  UserSwichView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct UserSwichView: View {
    
    @State var selectedOption: String = "산이"
    let options = ["류산", "류들"]
    
    var body: some View {
        HStack {
            Text("나는")
            
            Picker(selection: $selectedOption, label: Text("Select an option"))
            {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }
        } .accentColor(.black)
            .font(.DlnlTitle3)
        //기본 컴포넌트 사이즈와 폰트 바꾸는 방법 찾아보기
           // . scaleEffect(1.2)
        
        //            Text("What you picked:")
        //            Text(selectedOption)
        //                .foregroundColor(Color.purple)
        //                .bold()
    }
}


#Preview {
    UserSwichView()
}
