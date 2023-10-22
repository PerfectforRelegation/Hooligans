//
//  Board.swift
//  Hooligans
//
//  Created by Joseph on 2023/09/26.
//

import Foundation
import UIKit

struct Board: Codable {
    let id: Int
    let nickname, title, content: String
    let heart, hate, view: Int
    let modified: Bool
    let boardDate: String
}

struct Post: Codable {
    let title: String
    let content: String
    var likes: Int
    var comments: Int   // 댓글 수
    var images: [String]
    var videoURLs: [URL]

    init(title: String, content: String, likes: Int = 0, comments: Int = 0, images: [String] = [], videoURLs: [URL] = []) {
        self.title = title
        self.content = content
        self.likes = likes
        self.comments = comments
        self.images = images
        self.videoURLs = videoURLs
    }

    // 이미지를 Data로 변환하여 저장
    mutating func addImage(_ image: UIImage) {
        if let imageData = image.pngData() {
            self.images.append(imageData.base64EncodedString())
        }
    }

    // 이미지 문자열을 UIImage로 변환하여 반환
    func getImage(at index: Int) -> UIImage? {
        if index >= 0, index < images.count, let imageData = Data(base64Encoded: images[index]) {
            return UIImage(data: imageData)
        }
        return nil
    }
}


//    let id: Int
//    //let nickname, title, content: String
//    let heart, hate, view: Int
//    let modified: Bool
//    let boardDate: String

