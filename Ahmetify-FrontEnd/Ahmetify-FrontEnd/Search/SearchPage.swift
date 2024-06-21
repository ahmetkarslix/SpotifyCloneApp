//
//  SearchPage.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import SwiftUI

struct SearchPage: View {
    var searchText: String
    @State private var songs: [Song] = []
    @State private var showAlert = false
    @State private var goBack = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Arama Sonuçları")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)

            ScrollView {
                ForEach(songs) { song in
                    SongsRow(song: song)
                        .padding(.horizontal)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .padding(.vertical, 4)
                }
            }
            .onAppear(perform: fetchSongs)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Arama Sonuçları")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Uyarı"),
                message: Text("Bu sanatçı ile ilgili bir şarkı bulunamadı."),
                dismissButton: .default(Text("Tamam"), action: {
                    self.goBack = true
                })
            )
        }
        .background(
            NavigationLink(destination: SearchView(mainPlaylists: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify")), isActive: $goBack) {
                EmptyView()
            }
        )
    }

    func fetchSongs() {
        guard let url = URL(string: "http://localhost:8080/api/song?artist=\(searchText)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Song].self, from: data) {
                    DispatchQueue.main.async {
                        self.songs = decodedResponse
                        if self.songs.isEmpty {
                            self.showAlert = true
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.showAlert = true
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.showAlert = true
                }
            }
        }.resume()
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage(searchText: "Example Artist")
    }
}
