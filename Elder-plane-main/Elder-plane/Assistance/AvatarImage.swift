//
//  AvatarImage.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//

import SwiftUI

struct AvatarImage: View {
    let image: String
    let size: CGSize
    
    init(image: String, size: CGSize) {
        self.image = image
        self.size = size
    }
    
    var body: some View {
        if image.hasPrefix("http"), let url = URL(string: image) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(image)
                .resizable()
                .frame(width: size.width, height: size.height)
                .cornerRadius(5)
        }
    }
}
