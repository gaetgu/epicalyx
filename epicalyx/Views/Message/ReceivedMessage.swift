//
//  ReceivedMessage.swift
//  epicalyx
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import SwiftUI

struct ReceivedMessage: View {
    @AppStorage("Nickname") var nickname: String = "you"
    @State var sender: String
    @State var message: String
    
    var body: some View {
        let words_in_message = message.split(separator: " ")
        let is_user_mentioned = words_in_message.contains(Substring(nickname)) || words_in_message.contains(Substring(nickname + ":")) || words_in_message.contains(Substring(nickname + ","))
        
        HStack {
            Text("← **\(sender):** \(try! AttributedString(markdown: message))")
                .multilineTextAlignment(.leading)
                .textSelection(.enabled)
                .padding(.horizontal, 12)
                .padding(.vertical, 2)
                .background(is_user_mentioned ? Color.blue.opacity(0.45) : nil)
                .cornerRadius(20)
            
            Spacer()
        }
    }
}
