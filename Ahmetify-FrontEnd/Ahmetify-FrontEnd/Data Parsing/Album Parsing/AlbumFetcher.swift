//
//  AlbumFetcher.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import Foundation
import Combine

class AlbumFetcher: ObservableObject {
    @Published var albums: [Album] = []
    @Published var isLoading = false
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchAlbums()
    }

    func fetchAlbums() {
        guard let url = URL(string: "http://localhost:8080/api/album") else {
            return
        }
        
        isLoading = true
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Album].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { albums in
                self.albums = albums
            })
            .store(in: &cancellables)
    }
}

