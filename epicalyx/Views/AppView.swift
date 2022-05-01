//
//  AppView.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/24/22.
//

import SwiftUI

struct AppView: View {    
    var body: some View {
        NavigationView {
            Sidebar()
        }
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: { }) {
                    Image(systemName: "info.circle")
                }
                .disabled(true)
            }
        }
    }
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}
