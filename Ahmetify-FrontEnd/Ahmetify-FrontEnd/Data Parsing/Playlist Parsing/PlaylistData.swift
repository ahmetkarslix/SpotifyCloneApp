//
//  PlaylistData.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.05.2024.
//

import Foundation

struct Playlist: Hashable ,Codable, Identifiable {
    var id: UUID?
    var img: String
    var name: String
    var genre: String
    var creator: String
}
