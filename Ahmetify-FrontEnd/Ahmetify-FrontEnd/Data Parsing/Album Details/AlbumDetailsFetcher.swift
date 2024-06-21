//
//  AlbumDetailsFetcher.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.06.2024.
//
import Foundation
import Combine


class AlbumDetailsFetcher: ObservableObject {
    @Published var albumDetails: [AlbumDetails] = []
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchAlbumDetails()
    }
    
    func fetchAlbumDetails() {
        guard let url = URL(string: "http://localhost:8080/api/isles") else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [AlbumDetails].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching album details: \(error.localizedDescription)")
                }
            }, receiveValue: { albumDetails in
                self.albumDetails = albumDetails
            })
    }
}
