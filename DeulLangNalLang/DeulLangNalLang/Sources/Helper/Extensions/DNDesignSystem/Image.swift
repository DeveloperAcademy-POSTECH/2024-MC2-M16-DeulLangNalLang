//
//  Image.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/21/24.
//

import SwiftUI

extension Image {
    func awardImage(themeName: String) -> Image {
        return Image("award"+themeName)
    }

    func cardImage(themeName: String) -> Image {
        return Image("card"+themeName)
    }
    
    let grayDoorImage: Image = Image("GrayDoor")
    let 
}
