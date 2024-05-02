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
                    Spacer()
                    PostView(imageUrl: post.thumbnailUrl, title: post.title)
                        .frame(width: 320)
                    Spacer()
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
