//
//  OnboardView.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/23/22.
//

import SwiftUI
import Combine

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var nick: String
    @Binding var secondary_nick: String
    @Binding var network: AvailableNetworks
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Let's get you set up!")
                .font(.headline)
            
            Spacer()
            
            Group {
                Text("Choose a primary and secondary nickname to use.")
                TextField("Primary Nickname", text: $nick)
                    .disableAutocorrection(true)
                    .onReceive(Just(nick)) { nick = String($0.prefix(20)).replacingOccurrences(of: " ", with: "_") }
                TextField("Secondary Nickname", text: $secondary_nick)
                    .disableAutocorrection(true)
                    .onReceive(Just(secondary_nick)) { secondary_nick = String($0.prefix(20)).replacingOccurrences(of: " ", with: "_") }
            }
            
            Spacer()
            
            Group {
                Text("Select a primary server.")
                Picker("Server", selection: $network) {
                    Text("w3c").tag(AvailableNetworks.w3c)
                    Text("freenode").tag(AvailableNetworks.freenode)
                    Text("libera").tag(AvailableNetworks.libera)
                }
            }
            
            Spacer()
            
            Button("OK") {
                saveSettings()
                dismiss()
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(minWidth: 600, minHeight: 300)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func saveSettings() {
        UserDefaults.standard.set(self.nick, forKey: "Nickname")
        UserDefaults.standard.set(self.secondary_nick, forKey: "SecondaryNickname")
    }
}

