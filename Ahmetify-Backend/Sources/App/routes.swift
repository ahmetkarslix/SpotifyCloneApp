//
//  routes.swift
//
//
//  Created by Ahmet Karslı on 13.05.2024.
//


import Vapor
import Fluent

func routes(_ app: Application) throws {
    let userController = UserController()
    try app.register(collection: userController)

        // Playlist
        app.get("api", "playlist") { req -> EventLoopFuture<[Playlist]> in
            return Playlist.query(on: req.db).all()
        }

        app.post("api", "playlist") { req -> EventLoopFuture<Playlist> in
            let playlist = try req.content.decode(Playlist.self)
            return playlist.create(on: req.db).map { playlist }
        }
        
        app.delete("api", "playlist", ":playlistID", use: PlaylistController().deleteByID)
        
        
        // Albüm İçerikleri
        app.get("api", "isles") { req -> EventLoopFuture<[Isles]> in
            return Isles.query(on: req.db).all()
        }

        app.post("api", "isles") { req -> EventLoopFuture<Isles> in
            let isles = try req.content.decode(Isles.self)
            return isles.create(on: req.db).map { isles }
        }

        // Podcast
        app.get("api", "podcast") { req -> EventLoopFuture<[Podcast]> in
            return Podcast.query(on: req.db).all()
        }

        app.post("api", "podcast") { req -> EventLoopFuture<Podcast> in
            let podcast = try req.content.decode(Podcast.self)
            return podcast.create(on: req.db).map { podcast }
        }

        // Album
        app.get("api", "album") { req -> EventLoopFuture<[Album]> in
            return Album.query(on: req.db).all()
        }

        app.post("api", "album") { req -> EventLoopFuture<Album> in
            let album = try req.content.decode(Album.self)
            return album.create(on: req.db).map { album }
        }
    
        // Song
        app.get("api", "song") { req -> EventLoopFuture<[Song]> in
            return Song.query(on: req.db).all()
        }

        app.post("api", "song") { req -> EventLoopFuture<Song> in
            let song = try req.content.decode(Song.self)
            return song.create(on: req.db).map { song }
        }
        
        
        app.delete("api", "song", ":songID") { req -> EventLoopFuture<HTTPStatus> in
            guard let songID = req.parameters.get("songID", as: UUID.self) else {
                throw Abort(.badRequest)
            }
            
            return Song.find(songID, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap { song in
                    return song.delete(on: req.db).transform(to: .noContent)
                }
        }
        
        
        app.put("api", "song", ":songID") { req -> EventLoopFuture<Song> in
            let updatedSong = try req.content.decode(Song.self)
            guard let songID = req.parameters.get("songID", as: UUID.self) else {
                throw Abort(.badRequest)
            }
            
            return Song.find(songID, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap { song in
                    song.img = updatedSong.img
                    song.name = updatedSong.name
                    song.artist = updatedSong.artist
                    return song.save(on: req.db).map { song }
                }
        }
    
    let songController = SongController()
        try app.register(collection: songController)
    }



