//
//  Album.swift
//
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Vapor
import Fluent

final class Album: Model, Content {
    static let schema = "album"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "img")
    var img: String

    @Field(key: "album")
    var album: String

    @Field(key: "artistimg")
    var artistimg: String

    @Field(key: "artist")
    var artist: String

    @Field(key: "badge")
    var badge: Bool

    @Field(key: "year")
    var year: String

    @Field(key: "date")
    var date: String

    @Field(key: "songs")
    var songs: Int

    @Field(key: "time")
    var time: String

    @Field(key: "cright")
    var cright: String

    init() { }

    init(id: UUID? = nil, img: String, album: String, artistimg: String, artist: String, badge: Bool, year: String, date: String, songs: Int, time: String, cright: String) {
        self.id = id
        self.img = img
        self.album = album
        self.artistimg = artistimg
        self.artist = artist
        self.badge = badge
        self.year = year
        self.date = date
        self.songs = songs
        self.time = time
        self.cright = cright
    }
}
