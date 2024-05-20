//
//  SegmentedPickerView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/18/24.
//
//
import SwiftUI

struct SegmentedPickerView: View {
    
    @Binding var selection: Int
    
    let filterOptions: [String] = [
        "전체 상장보기",
        "소중한 상장"
    ]
    
    var body: some View {
        
        Picker(selection: $selection,
               label: Text("picker"),
               content: {
            ForEach(filterOptions.indices) { index in
                Text(filterOptions[index])
                    .font(.headlineEmphasized)
            }
        })
        .pickerStyle(SegmentedPickerStyle())
        .onAppear {
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
            
            let attributes: [NSAttributedString.Key:Any] = [
                //원하는 색상
                .foregroundColor : UIColor.black
            ]
            UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
        }
    }
}

#Preview {
    SegmentedPickerView(selection: .constant(1))
}
