//
//  ChatListView.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//

import SwiftUI

struct ChatListView: View {
    @ObservedObject var modelData: ViewModel
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(modelData.messages) { message in
                            MessageRowView(message: message) { message in
                                // 再試一次
                                Task { @MainActor in
                                    await modelData.retry(message: message)
                                }
                            }
                        }
                    }
                    .onChange(of: modelData.messages.last?.responseText) { newValue in
                        scrollToBottom(proxy: proxy)
                    }
                }
                
                Divider()
                
                inputView(proxy: proxy)
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
    
    func inputView(proxy: ScrollViewProxy) -> some View {
        HStack(alignment: .top) {
            AvatarImage(
                image: modelData.userAvatar,
                size: CGSize(width: 30, height: 30)
            )
            
             TextField("輸入訊息", text: $modelData.inputMessage, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                    .focused($isTextFieldFocused)
                    .disabled(modelData.isInteractingWithChatGPT)
            
            if modelData.isInteractingWithChatGPT {
                DotLoadingView(dotCount: 3)
                    .scaleEffect(1 / 2)
                    .frame(width: 45, height: 30)
            } else {
                Button {
                    // 發送訊息
                    Task { @MainActor in
                        isTextFieldFocused = false
                        scrollToBottom(proxy: proxy)
                        await modelData.sendTapped()
                    }
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .rotationEffect(.degrees(45))
                        .font(.system(size: 30))
                }
                .disabled(modelData.inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
    
    private func scrollToBottom(proxy: ScrollViewProxy) {
        guard let id = modelData.messages.last?.id else { return }
        proxy.scrollTo(id, anchor: .bottomTrailing)
    }
}
