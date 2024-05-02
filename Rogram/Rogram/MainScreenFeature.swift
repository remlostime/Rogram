//
//  MainScreenFeature.swift
//  Rogram
//
//  Created by Kai Chen on 5/1/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainScreenFeature {
    @ObservableState
    struct State: Equatable {
        var posts: [Post] = []
    }
    
    enum Action {
        case initialLoad
        case receivedFeedResponse(PostResponse)
        case tapPost(Post)
    }
    
    @Dependency(\.postNetworkClient) var postNetworkClient
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .initialLoad:
                return .run { send in
                    let result = await postNetworkClient.fetchPosts()
                    await send(.receivedFeedResponse(result))
                }
            case .receivedFeedResponse(let response):
                switch response {
                case .success(let posts):
                    state.posts = posts
                case .failure(let error):
                    // todo: maybe add the error as param in `state`?
                    print(error)
                }
                return .none
            case .tapPost(let post):
                // todo: add navigation dst
                return .none
            }
        }
    }
}
