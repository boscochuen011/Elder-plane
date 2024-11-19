//
//  ChatGPTAPIModel_1.swift
//  chatgpt
//
//  Created by Yip Cheuk Wing on 19/11/2023.
//

import Foundation

struct Request: Codable {
    let model: String
    let messages: [Message]
    let temperature: Double
    let stream: Bool
}

struct Message: Codable {
    let role: ChatGPTRole
    let content: String
    
    enum ChatGPTRole: String, Codable {
        case system
        case user
        case assistant
    }
}

extension Array where Element == Message {
    // 計算所有訊息的內容總字數
    var contentCount: Int { reduce(0, { $0 + $1.content.count }) }
}
