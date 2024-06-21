//
//  PodcastData.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.05.2024.
//

import Foundation

struct Podcast: Hashable ,Codable, Identifiable {
    var id: UUID?
    var img: String
    var podcast: String
    var episode: String
    var network: String
    var time: String
    var timeleft: Int
    var duration: Int
    var description: String
}
