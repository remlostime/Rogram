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
        NavigationStack {
            List(store.posts) { post in
                NavigationLink(value: post) {
                    PostView(imageUrl: post.thumbnailUrl, title: post.title)
                }
            }
            .navigationDestination(for: Post.self) { post in
                PostView(imageUrl: post.url, title: post.title)
            }
            .listStyle(.plain)
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
