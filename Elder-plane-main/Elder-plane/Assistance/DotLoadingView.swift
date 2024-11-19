//
//  DotLoadingView.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//

import SwiftUI

struct DotLoadingView: View {
    let dotCount: Int
    @State private var isAnimation = false
    
    init(dotCount: Int = 4) {
        self.dotCount = dotCount < 1 ? 0 : dotCount
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0 ..< dotCount, id: \.self) { index in
                Circle()
                    .fill(.gray)
                    .frame(width: 20, height: 20)
                    .scaleEffect(isAnimation ? 1.0 : 0.5)
                    .opacity(isAnimation ? 1 : 0.5)
                    .animation(
                        Animation.easeInOut(duration: 0.5)
                            .repeatForever()
                            .delay(Double(index) * 0.2),
                        value: isAnimation
                    )
            }
        }
        .onAppear {
            isAnimation.toggle()
        }
    }
}
