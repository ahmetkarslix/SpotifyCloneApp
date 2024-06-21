//
//  SongController.swift
//
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import Vapor
import Fluent

struct SongController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let songsRoute = routes.grouped("api", "song")
        songsRoute.get(use: searchSongsByArtist)
    }
    
    func searchSongsByArtist(req: Request) throws -> EventLoopFuture<[Song]> {
        guard let artist = req.query[String.self, at: "artist"] else {
            throw Abort(.badRequest, reason: "Missing artist parameter")
        }
        
        // Şarkıları sanatçı ismine göre filtrele
        return Song.query(on: req.db)
            .filter(\.$artist == artist)
            .all()
    }
}

