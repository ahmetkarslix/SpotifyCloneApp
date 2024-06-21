//
//  CreateSong.swift
//
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import Fluent

struct CreateSong: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("song")
            .id()
            .field("img", .string, .required)
            .field("name", .string, .required)
            .field("artist", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("song").delete()
    }
}
