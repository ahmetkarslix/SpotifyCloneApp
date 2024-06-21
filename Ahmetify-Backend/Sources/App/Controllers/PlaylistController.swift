//
//  PlaylistController.swift
//  
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import Vapor

final class PlaylistController {
    
    func deleteByID(req: Request) throws -> EventLoopFuture<HTTPResponseStatus> {
        let playlistID = try req.parameters.require("playlistID", as: UUID.self)
        
        return Playlist.find(playlistID, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { playlist in
                return playlist.delete(on: req.db)
                    .transform(to: .noContent)
            }
    }
    
}
