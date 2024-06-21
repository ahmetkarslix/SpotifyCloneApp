//
//  PodcastFetcher.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.06.2024.
//

import Foundation
import Combine

class PodcastFetcher: ObservableObject {
    @Published var podcasts: [Podcast] = []
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchPodcasts()
    }
    
    func fetchPodcasts() {
        guard let url = URL(string: "http://localhost:8080/api/podcast") else {
            print("Invalid URL")
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Podcast].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching podcasts: \(error.localizedDescription)")
                }
            }, receiveValue: { podcasts in
                self.podcasts = podcasts
            })
    }
}
