//
//  ContentView.swift
//  Rogram
//
//  Created by Kai Chen on 5/1/24.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<MainScreenFeature>
    
    var body: some View {
        List(store.posts) { post in
            PostView(imageUrl: post.thumbnailUrl, title: post.title)
                .onTapGesture {
                    store.send(.tapPost(post))
                }
        }
        .onAppear {
            store.send(.initialLoad)
        }
    }
}

#Preview {
    ContentView(store: .init(initialState: MainScreenFeature.State(posts: [.empty]),
                             reducer: {
        MainScreenFeature()
    }))
}