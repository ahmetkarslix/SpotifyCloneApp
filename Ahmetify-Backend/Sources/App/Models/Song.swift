//
//  Song.swift
//  
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Vapor
import Fluent

final class Song: Model, Content {
    static let schema = "song"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "img")
    var img: String

    @Field(key: "name")
    var name: String

    @Field(key: "artist")
    var artist: String


    init() { }

    init(id: UUID? = nil, img: String, name: String, artist: String) {
        self.id = id
        self.img = img
        self.name = name
        self.artist = artist
       
    }
}
