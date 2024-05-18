//
//  Boast.swift
//  DeulLangNalLang
//
//  Created by 윤동주 on 5/18/24.
//

import SwiftUI

class Boast {
    var id = UUID()
    var contents: String
    /// 이미지 개수: 0~2개
    private var images: [Image] = []
    var date: Date
    var award: Award?
    
    init(contents: String, date: Date) {
        self.contents = contents
        self.date = date
    }
}

// MARK: - Functions

extension Boast {
    
    /// Boast에 Award 등록
    func registerAward(award: Award) {
        self.award = award
    }
    
    /// Boast에 Image 추가
    /// - image 개수가 가득찼을 경우 가장 먼저 추가한 사진부터 제거 후 추가
    func addImage(with image: Image) {
        if self.images.count >= BoastImageCapacity {
            self.images.remove(at: 0)
        }
        self.images.append(image)
    }
    
    /// Boast images에서 매개변수 image 제거
    func removeImage(with image: Image){
        if let index = self.images.firstIndex(of: image) {
            self.images.remove(at: index)
        }
    }
}

// MARK: - Protocols

extension Boast: Hashable {
    static func == (lhs: Boast, rhs: Boast) -> Bool {
        lhs.id == rhs.id
    }
    
    /// Boast를 id 기준으로 Set, Dictionary에서 사용
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

