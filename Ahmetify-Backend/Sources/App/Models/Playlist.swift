//
//  Playlist.swift
//
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Vapor
import Fluent

final class Playlist: Model, Content {
    static let schema = "playlist"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "img")
    var img: String

    @Field(key: "name")
    var name: String

    @Field(key: "genre")
    var genre: String

    @Field(key: "creator")
    var creator: String

    init() { }

    init(id: UUID? = nil, img: String, name: String, genre: String, creator: String) {
        self.id = id
        self.img = img
        self.name = name
        self.genre = genre
        self.creator = creator
    }
}
