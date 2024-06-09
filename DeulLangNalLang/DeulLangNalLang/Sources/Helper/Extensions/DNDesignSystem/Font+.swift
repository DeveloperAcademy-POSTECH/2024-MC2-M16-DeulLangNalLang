//
//  Font.swift
//  DeulLangNalLang
//
//  Created by Jen on 5/18/24.
//

import SwiftUI

extension Font {
    
    // LargeTitle
    static let largeTitleRegular: Font = .custom("AppleSDGothicNeo-Regular", size: 29)
    static let largeTitleEmphasized: Font = .custom("AppleSDGothicNeo-Heavy", size: 29)
    
    // Title1
    static let title1Regular: Font = .custom("AppleSDGothicNeo-Regular", size: 25)
    static let title1Emphasized: Font = .custom("AppleSDGothicNeo-Bold", size: 25)
    
    // Title2
    static let title2Regular: Font = .custom("AppleSDGothicNeo-Regular", size: 20.5)
    static let title2Emphasized: Font = .custom("AppleSDGothicNeo-Bold", size: 20.5)
    
    // Title3
    static let title3Regular: Font = .custom("AppleSDGothicNeo-Regular", size: 19)
    static let title3Emphasized: Font = .custom("AppleSDGothicNeo-Bold", size: 19)
    
    // Headline
    static let headlineEmphasized: Font = .custom("AppleSDGothicNeo-Bold", size: 17)
    
    // Body
    static let bodyRegular: Font = .custom("AppleSDGothicNeo-Regular", size: 16.5)
    static let bodyEmphasized: Font = .custom("AppleSDGothicNeo-SemiBold", size: 16.5)
    
    // Callout
    static let calloutRegular: Font = .custom("AppleSDGothicNeo-Regular", size: 16)
    static let calloutEmphasized: Font = .custom("AppleSDGothicNeo-Bold", size: 16)
    
    // Subheadline
    static let subheadlineRegular: Font = .custom("AppleSDGothicNeo-Regular", size: 15)
    static let subheadlineEmphasized: Font = .custom("AppleSDGothicNeo-SemiBold", size: 15)
    
    // Footnote
    static let footnoteRegular: Font = .custom("AppleSDGothicNeo-Regular", size: 13)
    static let footnoteEmphasized: Font = .custom("AppleSDGothicNeo-SemiBold", size: 13)

    // Caption1
    static let caption1Regular: Font = .custom("AppleSDGothicNeo-Regular", size: 11)
    static let caption1Emphasized: Font = .custom("AppleSDGothicNeo-SemiBold", size: 11)
    
    // Caption2
    static let caption2Regular: Font = .custom("AppleSDGothicNeo-Regular", size: 10.5)
    static let caption2Emphasized: Font = .custom("AppleSDGothicNeo-SemiBold", size: 10.5)
}

extension UIFont {
    static func bodyRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: 16.5) ?? UIFont.systemFont(ofSize: 16.5)
    }
}


