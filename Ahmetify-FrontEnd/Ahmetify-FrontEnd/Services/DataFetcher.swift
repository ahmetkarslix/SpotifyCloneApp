//
//  DataFetcher.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 28.05.2024.
//

import Foundation

class DataFetcher: ObservableObject {
    @Published var albums: [Album] = []
    @Published var podcasts: [Podcast] = []
    @Published var playlists: [Playlist] = []
    @Published var isles: [AlbumDetails] = []

    init() {
        Task {
            await fetchAlbums()
            await fetchPodcasts()
            await fetchPlaylists()
            await fetchIsles()
        }
    }

    func fetchAlbums() async {
        await fetchData(from: "http://localhost:8080/api/album", assignTo: \.albums)
    }

    func fetchPodcasts() async {
        await fetchData(from: "http://localhost:8080/api/podcast", assignTo: \.podcasts)
    }

    func fetchPlaylists() async {
        await fetchData(from: "http://localhost:8080/api/playlist", assignTo: \.playlists)
    }

    func fetchIsles() async {
        await fetchData(from: "http://localhost:8080/api/isles", assignTo: \.isles)
    }

    private func fetchData<T: Decodable>(from urlString: String, assignTo keyPath: ReferenceWritableKeyPath<DataFetcher, [T]>) async {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([T].self, from: data)
            DispatchQueue.main.async {
                self[keyPath: keyPath] = decodedData
            }
        } catch {
            print("Failed to fetch data from \(urlString): \(error)")
        }
    }
}
