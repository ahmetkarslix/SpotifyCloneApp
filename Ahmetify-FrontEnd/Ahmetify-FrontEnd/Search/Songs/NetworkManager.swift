//
//  NetworkManager.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var songs: [Song] = []
    
    func fetchSongs(searchText: String) {
        guard let url = URL(string: "http://localhost:8080/api/song?search=\(searchText)") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode([Song].self, from: data) {
                DispatchQueue.main.async {
                    self.songs = decodedResponse
                }
            } else {
                print("Failed to decode response")
            }
        }.resume()
    }
}
