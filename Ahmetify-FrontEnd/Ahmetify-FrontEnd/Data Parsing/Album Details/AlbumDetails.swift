//
//  File.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.05.2024.
//

import Foundation

struct AlbumDetails: Hashable ,Codable, Identifiable {
    var id: UUID?
    var title: String
    var artists: String
}
