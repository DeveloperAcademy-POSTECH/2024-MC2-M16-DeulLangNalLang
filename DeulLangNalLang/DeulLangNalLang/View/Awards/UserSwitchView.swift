//
//  UserSwichView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct UserSwitchView: View {
    
    @State var selectedOption: String = "산이"
    let options = ["류산", "류들"]
    
    var body: some View {
        
        Menu {
            Button("류산", action: {selectedOption = "산이"})
            Button("류들", action: {selectedOption = "들이"})
        } label: {
            Text("나는 \(selectedOption) \(Image(systemName: "chevron.down")) ")
        } .font(.DlnlTitle3SB)
            .accentColor(.black)
    }
}



#Preview {
    UserSwitchView()
}
