//
//  PostView.swift
//  Rogram
//
//  Created by Kai Chen on 5/2/24.
//

import SwiftUI

struct PostView: View {
    let imageUrl: URL
    let title: String
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: imageUrl)
            Text(title)
        }
    }
    
}

#Preview {
    PostView(imageUrl: URL(string: "https://via.placeholder.com/150/9e59da")!, title: "title")
}
