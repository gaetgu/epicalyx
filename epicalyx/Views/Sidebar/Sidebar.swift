//
//  Sidebar.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import SwiftUI
import IRC

struct Sidebar: View {
    @State var selection: Set<Int> = [0]
    @State private var isShowingAddChannel = false
    
    @State var local_channels: [Channel] = [
        Channel(channel: "tests", network: .w3c, name: "Testing Channel"),
        Channel(channel: "chill", network: .libera, name: "Chilling out")
    ]
    
    var body: some View {
        Group {
            List(selection: self.$selection) {
//                Button("Reset UserDefaults") {
//                    if let bundleID = Bundle.main.bundleIdentifier {
//                        UserDefaults.standard.removePersistentDomain(forName: bundleID)
//                    }
//                }
                
                ForEach(local_channels) { channel in
                    ChannelCell(channel: channel)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Channels")
            .safeAreaInset(edge: .bottom) {
//                SidebarBottom(isShowingAddChannel: $isShowingAddChannel, channels: channels, selection: selection)
            }
            
            
            Text("No channel selected")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .sheet(isPresented: $isShowingAddChannel) {
            NewChannelView()
        }
    }
}
