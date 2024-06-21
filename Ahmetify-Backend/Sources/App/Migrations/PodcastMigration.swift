//
//  PodcastMigration.swift
//  
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Fluent

struct PodcastMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("podcast")
            .id()
            .field("img", .string)
            .field("podcast", .string)
            .field("episode", .string)
            .field("network", .string)
            .field("time", .string)
            .field("timeleft", .int)
            .field("duration", .int)
            .field("description", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("podcast").delete()
    }
}
