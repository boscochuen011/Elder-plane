//
//  ContentView.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//

import SwiftUI

struct AssistanceView: View {
    @StateObject var modelData = ViewModel(api: ChatGPTAPI(apiKey: "sk-NGmE9q31EN1h3bjr54Fe9e894f3d443eAbE92c80F1410743"))
    
    var body: some View {
        //NavigationView {
        VStack {
            HStack {
                Spacer()
                Button {
                    modelData.clearMessages()
                } label: {
                    Label("Clear", systemImage: "trash")
                }.disabled(modelData.isInteractingWithChatGPT)
            }
            ChatListView(modelData: modelData)
//            
//                .navigationTitle("ChatGPT")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    
//                    
//                }
        }
        //}
    }
}


#Preview {
    AssistanceView()
}
