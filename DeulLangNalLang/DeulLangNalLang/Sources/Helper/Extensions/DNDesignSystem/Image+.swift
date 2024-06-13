//
//  Image.swift
//  DeulLangNalLang
//
//  Created by Huijeong Bae on 5/21/24.
//

import SwiftUI

extension Image {
    static func award(themeName: String) -> Image {
        return Image("award"+themeName)
    }

    static func card(themeName: String) -> Image {
        return Image("card"+themeName)
    }
    
    static let grayDoor: Image = Image("GrayDoor")
    static let awardMuseum: Image = Image(systemName: "rectangle.portrait.inset.filled")
    static let boastPostOffice: Image = Image(systemName: "envelope.fill")
    static let chevronDown: Image = Image(systemName: "chevron.down")
    static let chevronLeft: Image = Image(systemName: "chevron.left")
    static let filledHeart: Image = Image(systemName: "heart.fill")
    static let unfilledHeart: Image = Image(systemName: "heart")
    static let filteringButton: Image = Image(systemName: "line.3.horizontal.decrease.circle")
    static let plusButton: Image = Image(systemName: "plus")
    static let camera: Image = Image(systemName: "camera")
    static let library: Image = Image(systemName: "photo.on.rectangle")
    static let xButton: Image = Image(systemName: "xmark.circle.fill")
    static let threeDot: Image = Image(systemName: "ellipsis")
    static let profile: Image = Image(systemName: "person.circle")
}
