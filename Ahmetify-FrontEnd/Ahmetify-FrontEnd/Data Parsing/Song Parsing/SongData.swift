//
//  SongData.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import Foundation

struct Song: Hashable ,Codable, Identifiable {
    var id: UUID?
    var img: String
    var name: String
    var artist: String
}
