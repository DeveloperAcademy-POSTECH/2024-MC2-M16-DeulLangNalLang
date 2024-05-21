//
//  AwardCarouselView.swift
//  DeulLangNalLang
//
//  Created by JIN LEE on 5/20/24.
//

import SwiftUI


struct AwardCarouselView: View {
    
    let awardCategory: AwardCategory
    var body: some View {
        awardCategory.image
    }
}

#Preview {
    AwardCarouselView(awardCategory: .gem)
}
