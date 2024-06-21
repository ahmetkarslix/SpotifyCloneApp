//
//  configure.swift
//
//
//  Created by Ahmet Karslı on 13.05.2024.
//


import Vapor
import Fluent
import FluentPostgresDriver


public func configure(_ app: Application) async throws {
    app.databases.use(
        .postgres(
            configuration: .init(
                hostname: "localhost",
                username: "postgres",
                password: "Ayk123321",
                database: "postgres",
                tls: .disable
            )
        ),
        as: .psql
    )
    
    app.migrations.add(CreateUser())
    app.migrations.add(AlbumMigration())
    app.migrations.add(PodcastMigration())
    app.migrations.add(PlaylistMigration())
    app.migrations.add(IslesMigration())
    app.migrations.add(CreateSong())
    
    app.logger.logLevel = .debug
    
    try await app.autoMigrate().get()
    
    try routes(app)
}
