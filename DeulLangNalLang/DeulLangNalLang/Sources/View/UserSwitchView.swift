//
//  UserSwichView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//

import SwiftUI

struct UserSwitchView: View {
    @Environment(User.self) var user: User
    
    
    let options = ["류산", "류들"]
    
    var body: some View {
        @State var selectedOption = user.name
        
        VStack {
            Menu {
                Button("류산") {
                    user.name = "류산"
                    selectedOption = user.name
                }
                Button("류들") {
                    user.name = "류들"
                    selectedOption = user.name
                }
            } label: {
                Text("나는 \(selectedOption) \(Image(systemName: "chevron.down")) ")
            } .font(.title3Emphasized)
                .accentColor(.black)
        }
        .background(.dnBackground)
    }
}



#Preview {
    UserSwitchView()
}
