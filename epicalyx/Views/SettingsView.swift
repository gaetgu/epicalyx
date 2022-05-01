//
//  SettingsView.swift
//  epicalyx
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import SwiftUI
import Combine

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("Nickname") var nickname: String = "Anon3287652"
    @AppStorage("SecondaryNickname") var secondary_nickname: String = "use_epicalyx123"
    
    @State private var isError: Bool = false
    @State private var errorText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.system(.title))
            
            Spacer()
            
            if isError {
                Text("Error: \(errorText)")
                    .foregroundColor(Color.red)
            }
            
            HStack {
                Text("Nickname")
                    .font(.system(.title2))
                Text("(max 20 chars)")
            }
            
            Form {
                TextField(text: $nickname) { Text("Primary") }
                    .onReceive(Just(nickname)) { nickname = String($0.prefix(20)).replacingOccurrences(of: " ", with: "_") }
                TextField(text: $secondary_nickname) { Text("Secondary") }
                    .onReceive(Just(secondary_nickname)) { secondary_nickname = String($0.prefix(20)).replacingOccurrences(of: " ", with: "_") }
            }
            
            Spacer()
            
            Button("Done") {
                saveSettings()
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(width: 600, height: 300)
    }
    
    func saveSettings() {
        if nickname != "" {
            UserDefaults.standard.set(nickname, forKey: "Nickname")
            UserDefaults.standard.set(secondary_nickname, forKey: "SecondaryNickname")
            dismiss()
        } else {
            isError = true
            errorText = "Please enter a valid primary nickname"
        }
    }
}
