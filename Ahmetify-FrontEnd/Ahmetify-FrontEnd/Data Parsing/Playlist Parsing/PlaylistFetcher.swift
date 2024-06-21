//
//  PlaylistFetcher.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.06.2024.
//

import Foundation
import Combine

class PlaylistFetcher: ObservableObject {
    @Published var playlists: [Playlist] = []
    @Published var isLoading = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchPlaylists()
    }

    func fetchPlaylists() {
        guard let url = URL(string: "http://localhost:8080/api/playlist") else {
            return
        }
        
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Playlist].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { playlists in
                self.playlists = playlists
            })
            .store(in: &cancellables)
    }
}
