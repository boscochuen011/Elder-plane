//
//  MessageRow.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//
import SwiftUI

struct MessageRow: Identifiable {
    let id = UUID()
    
    var isInterctingWithChatGPT: Bool
    
    let sendAvatar: String
    let sendText: String
    
    let responseAvatar: String
    var responseText: String?
    var responseError: String?
}
