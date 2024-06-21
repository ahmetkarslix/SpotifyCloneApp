//
//  Isles.swift
//  
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Vapor
import Fluent

final class Isles: Model, Content {
    static let schema = "isles"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Field(key: "artists")
    var artists: String

    init() { }

    init(id: UUID? = nil, title: String, artists: String) {
        self.id = id
        self.title = title
        self.artists = artists
    }
}
