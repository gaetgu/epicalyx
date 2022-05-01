//
//  ContentView.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/22/22.
//

import SwiftUI

// Disable the annoying blue ring around a selected text box
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}

struct ContentView: View {
    @State private var shouldShowOnboarding = !UserDefaults.standard.bool(forKey: "Onboarded")
    
    @State private var nick: String = ""
    @State private var secondary_nick: String = ""
    @State private var network: AvailableNetworks = .w3c

    var body: some View {
        AppView()
        .sheet(isPresented: $shouldShowOnboarding, onDismiss: { UserDefaults.standard.set(true, forKey: "Onboarded") }) {
            OnboardingView(nick: $nick, secondary_nick: $secondary_nick, network: $network)
        }
    }
}
