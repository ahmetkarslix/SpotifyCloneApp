//
//  HomeViewModel.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 29.05.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var albums: [Album] = []
    @Published var podcasts: [Podcast] = []
    @Published var playlists: [Playlist] = []
    @Published var isles: [AlbumDetails] = []

    private let dataFetcher = DataFetcher()

    init() {
        fetchInitialData()
    }

    func fetchInitialData() {
        albums = dataFetcher.albums
        podcasts = dataFetcher.podcasts
        playlists = dataFetcher.playlists
        isles = dataFetcher.isles
    }
}
