//
//  essageRowView.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//

import SwiftUI

struct MessageRowView: View {
    @Environment(\.colorScheme) private var colorScheme
    let message: MessageRow
    var retryCallback: (MessageRow) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            singleMessage(
                text: message.sendText,
                image: message.sendAvatar,
                bgColor: colorScheme == .light ? .white : .black.opacity(0.5)
            )
            
            if let responseText = message.responseText {
                singleMessage(
                    text: responseText,
                    image: message.responseAvatar,
                    bgColor: colorScheme == .light ? .gray : .black,
                    error: message.responseError,
                    showLoading: message.isInterctingWithChatGPT
                )
            }
        }
    }
    
    /// 單行訊息
    func singleMessage(text: String, image: String, bgColor: Color, error: String? = nil, showLoading: Bool = false) -> some View {
        HStack(alignment: .top) {
            AvatarImage(
                image: image,
                size: CGSize(width: 30, height: 30)
            )
            
            VStack(alignment: .leading, spacing: 10) {
                if !text.isEmpty {
                    Text(text)
                        .multilineTextAlignment(.leading)
                        .textSelection(.enabled)
                }
                
                if let error = error {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.leading)
                        .textSelection(.enabled)
                    
                    Button("再試一次") {
                        retryCallback(message)
                    }
                    .buttonStyle(.bordered)
                }
                
                if showLoading {
                    DotLoadingView()
                        .scaleEffect(1 / 2)
                        .frame(width: 55, height: 22)
                }
            }
            .padding(.top, 4)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(bgColor)
    }
}
