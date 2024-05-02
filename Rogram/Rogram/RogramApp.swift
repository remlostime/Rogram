//
//  RogramApp.swift
//  Rogram
//
//  Created by Kai Chen on 5/1/24.
//

import SwiftUI

@main
struct RogramApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: .init(initialState: MainScreenFeature.State(posts: []),
                                     reducer: {
                MainScreenFeature()
            }))
        }
    }
}
