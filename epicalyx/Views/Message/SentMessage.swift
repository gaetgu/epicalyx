//
//  SentMessage.swift
//  epicalyx
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import SwiftUI

struct SentMessage: View {
    @AppStorage("Nickname") var nickname: String = "you"
    @State var message: String
    
    var body: some View {
        HStack {
            Text("→ **\(nickname):** \(try! AttributedString(markdown: message))")
                .multilineTextAlignment(.leading)
                .textSelection(.enabled)
                .padding(.horizontal, 12)
                .padding(.vertical, 2)
                .cornerRadius(20)
            
            Spacer()
        }
    }
}
