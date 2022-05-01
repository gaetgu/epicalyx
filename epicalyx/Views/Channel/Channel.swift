//
//  Channel.swift
//  mirc
//
//  Created by Gabriel Gutierrez on 4/25/22.
//

import Foundation

struct Channel: Hashable, Identifiable {
    var id = UUID()
    var channel: String
    var network: AvailableNetworks
    var name: String
}
