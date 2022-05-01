//
//  mircApp.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/22/22.
//

import SwiftUI

@main
struct epicalyxApp: App {    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
        
        Settings {
            SettingsView()
        }
    }
}
