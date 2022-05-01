//
//  ChannelView.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/22/22.
//

import SwiftUI

struct MessageView: View {
    @State private var isShowingChannelInfo = false
    @State var channel: Channel
    @State var newMessage = ""
    
    @Binding var messages: [String]
    
    var backgroundColor = Color(NSColor.controlBackgroundColor)
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack(spacing: 12) {
                        Message(message: "Welcome to #\(channel.channel)", sender: "Epicalyx")
                        ForEach(0..<messages.count, id: \.self) { i in
                            Message(message: messages[i], sender: i % 2 == 0 ? "RandomDude" : "gaetgu")
                        }
                    }
                    .padding()
                    // Add a listener to the messages array to listen for changes
                    .onReceive(messages.publisher) { _ in
                        // Add animation block to animate in new message
                        withAnimation {
                            scrollView.scrollTo(messages.endIndex - 1)
                        }
                    }
                }
            }
            
            HStack {
                TextField("New message", text: $newMessage, onCommit: { self.sendMessage() })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: { self.sendMessage() }) {
                    Image(systemName: "arrow.right")
                }
            }.padding()
        }
        .background(backgroundColor)
        .navigationTitle("\(channel.name )")
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: { self.isShowingChannelInfo.toggle() }) {
                    Image(systemName: "info.circle")
                }
                .popover(isPresented: $isShowingChannelInfo) {
                    VStack(alignment: .leading) {
                        Text("**Channel:** #\(channel.channel)")
                        Text("**Nick:** \(UserDefaults.standard.string(forKey: "Nickname") ?? "gggg")")
                    }.padding()
                }
            }
        }
    }
    
    func sendMessage() {
        if self.newMessage.rangeOfCharacter(from: NSCharacterSet.letters) != nil {
            self.messages.append(self.newMessage)
            self.newMessage = ""
        }
    }
}
