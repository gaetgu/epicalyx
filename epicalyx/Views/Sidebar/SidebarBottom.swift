//
//  SidebarBottom.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import SwiftUI

struct SidebarBottom: View {
    @Environment(\.controlActiveState) var activeState
    @Environment(\.managedObjectContext) var viewContext
    
    @Binding var isShowingAddChannel: Bool
    @State var channels: Channel
    @State var selection: Set<Int>
    
    var body: some View {
        HStack {
            Menu {
                Button("Add Channel") { self.isShowingAddChannel.toggle() }
            } label: {
                Image(systemName: "plus")
            }
            .menuStyle(.borderlessButton)
            .menuIndicator(.hidden)
            .opacity(activeState == .inactive ? 0.45 : 1)
        }
        .frame(height: 32, alignment: .center)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 4)
    }
}
