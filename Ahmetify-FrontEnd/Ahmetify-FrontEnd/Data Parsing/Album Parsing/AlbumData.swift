//
//  AlbumData.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import Foundation

struct Album: Hashable ,Codable, Identifiable {
    var id: UUID?
    var img: String
    var album: String
    var artistimg: String
    var artist: String
    var badge: Bool
    var year : String
    var date : String
    var songs: String
    var time : String
    var cright : String
}
