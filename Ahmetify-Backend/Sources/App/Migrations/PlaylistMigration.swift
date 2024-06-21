//
//  PlaylistMigration.swift
//  
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Fluent

struct PlaylistMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("playlist")
            .id()
            .field("img", .string)
            .field("name", .string)
            .field("genre", .string)
            .field("creator", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("playlist").delete()
    }
    
}
