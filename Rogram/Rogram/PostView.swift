//
//  PostView.swift
//  Rogram
//
//  Created by Kai Chen on 5/2/24.
//

import SwiftUI
import Kingfisher

struct PostView: View {
    let imageUrl: URL
    let title: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            KFImage(imageUrl)
                .placeholder {
                    Image("placeholder", bundle: nil)
                        .resizable()
                        .frame(width: 320, height: 320)
                }
            
            Text(title)
        }
    }
    
}

#Preview {
    PostView(imageUrl: URL(string: "https://via.placeholder.com/150/9e59da")!, title: "title")
}
