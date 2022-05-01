//
//  MessageView.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/22/22.
//

import SwiftUI

struct Message: View {
    @AppStorage("Nickname") var nickname: String = "you"
    
    @State var message: String
    @State var sender: String

    var body: some View {
        if sender == nickname {
            SentMessage(message: message)
        } else {
            ReceivedMessage(sender: sender, message: message)
        }
    }
}
