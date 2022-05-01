//
//  ChannelCell.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/22/22.
//

import SwiftUI

struct ChannelCell: View {
    @State var channel: Channel
    @State private var messages: [String] = []

    var body: some View {
        NavigationLink(destination: MessageView(channel: channel, messages: $messages)) {
            Group {
                Image(systemName: "number")
                    .font(.headline)
                Text(channel.channel)
            }
            .padding(.vertical, 6)
        }
    }
}
