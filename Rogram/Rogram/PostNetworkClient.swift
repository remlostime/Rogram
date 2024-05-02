//
//  PostNetworkClient.swift
//  Rogram
//
//  Created by Kai Chen on 5/1/24.
//

import Foundation
import ComposableArchitecture

typealias PostResponse = Result<[Post], Error>

protocol PostNetworkClient {
    func fetchPosts() async -> PostResponse
}

struct DefaultPostNetworkClient: PostNetworkClient {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/album/1/photos")
    
    func fetchPosts() async -> PostResponse {
        guard let url = url else {
            let error = NSError(domain: "error.url", code: 0)
            return .failure(error)
        }
        
        do {
            let (data, _) = try! await URLSession.shared.data(from: url)
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return .success(posts)
        } catch {
            return .failure(error)
        }
    }
}

extension DefaultPostNetworkClient: DependencyKey {
  static let liveValue = Self()
}

extension DependencyValues {
  var postNetworkClient: PostNetworkClient {
    self[DefaultPostNetworkClient.self]
  }
}
