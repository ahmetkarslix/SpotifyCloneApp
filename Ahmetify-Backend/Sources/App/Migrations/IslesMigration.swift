//
//  IslesMigration.swift
//  
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Fluent

struct IslesMigration: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("isles")
            .id()
            .field("title", .string)
            .field("artists", .string)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("isles").delete()
    }
}
