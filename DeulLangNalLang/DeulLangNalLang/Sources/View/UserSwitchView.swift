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
        
        @State var selectedOption: String = {
            if user.name == "류산" {
                return "산이"
            } else {
                return "들이"
            }
        }()
        
        Menu {
            Button("류산") {
                selectedOption = "산이"
                user.name = "류산"
            }
            Button("류들") {
                selectedOption = "들이"
                user.name = "류들"
            }
        } label: {
            Text("나는 \(selectedOption) \(Image(systemName: "chevron.down")) ")
        } .font(.title3Emphasized)
            .accentColor(.black)
    }
}



#Preview {
    UserSwitchView()
}
