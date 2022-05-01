//
//  NewChannelView.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import SwiftUI
import Combine

struct NewChannelView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var channel = ""
    @State private var name = ""
    @State private var errorText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add a channel")
                .font(.headline)
            
            if errorText != "" {
                Text("Error: \(errorText)")
                    .foregroundColor(Color.red)
            }
            
            Spacer()
            
            Group {
                HStack {
                    Text("#")
                    TextField("Channel", text: $channel)
                        .disableAutocorrection(true)
                        .onReceive(Just(channel)) { channel = String($0.prefix(200)).replacingOccurrences(of: " ", with: "_") }
                }
                TextField("Name the channel", text: $name)
                    .disableAutocorrection(true)
                    .onReceive(Just(name)) { name = String($0.prefix(200)).replacingOccurrences(of: " ", with: "_") }
            }
            
            Spacer()
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button("OK") {
                    dismiss()
                }
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(minWidth: 400, minHeight: 150)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
