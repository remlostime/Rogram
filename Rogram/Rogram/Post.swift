//
//  Post.swift
//  Rogram
//
//  Created by Kai Chen on 5/1/24.
//

import Foundation

/*
 {
   "albumId": 1,
   "id": 46,
   "title": "quidem maiores in quia fugit dolore explicabo occaecati",
   "url": "https://via.placeholder.com/600/e9b68",
   "thumbnailUrl": "https://via.placeholder.com/150/e9b68"
 },
 */

typealias PostId = Int

struct Post: Decodable, Equatable, Identifiable {
    let id: PostId
    let title: String
    let url: URL
    let thumbnailUrl: URL
}

extension Post {
    static let empty = Post(id: 0,
                            title: "empty",
                            url: URL(string: "https://empty.com")!,
                            thumbnailUrl: URL(string: "https://empty.com")!)
}
