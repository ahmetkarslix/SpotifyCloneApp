//
//  Podcast.swift
//
//
//  Created by Ahmet Karslı on 27.05.2024.
//

import Foundation
import Vapor
import Fluent

final class Podcast: Model, Content {
    static let schema = "podcast"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "img")
    var img: String

    @Field(key: "podcast")
    var podcast: String

    @Field(key: "episode")
    var episode: String

    @Field(key: "network")
    var network: String

    @Field(key: "time")
    var time: String

    @Field(key: "timeleft")
    var timeleft: Int

    @Field(key: "duration")
    var duration: Int

    @Field(key: "description")
    var description: String

    init() { }

    init(id: UUID? = nil, img: String, podcast: String, episode: String, network: String, time: String, timeleft: Int, duration: Int, description: String) {
        self.id = id
        self.img = img
        self.podcast = podcast
        self.episode = episode
        self.network = network
        self.time = time
        self.timeleft = timeleft
        self.duration = duration
        self.description = description
    }
}
