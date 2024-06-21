//
//  AlbumMigration.swift
//  
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Fluent

struct AlbumMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("album")
            .id()
            .field("img", .string)
            .field("album", .string)
            .field("artistimg", .string)
            .field("artist", .string)
            .field("badge", .bool)
            .field("year", .string)
            .field("date", .string)
            .field("songs", .int)
            .field("time", .string)
            .field("cright", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("album").delete()
    }
}
