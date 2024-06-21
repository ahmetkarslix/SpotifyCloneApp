//
//  PlaylistsView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.05.2024.
//

import SwiftUI

struct PlaylistsView: View {
    @State private var srch: String = ""
    @State private var playlists: [Playlist] = []
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    HStack {
                        Spacer(minLength: 0)
                        HStack(alignment: .center, spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                                .foregroundColor(.black)
                                .frame(minWidth: 0, maxWidth: 30)
                                .frame(minHeight: 0, maxHeight: 33)
                            TextField("Playlistlerde Ara", text: $srch)
                                .frame(height: 20)
                                .foregroundColor(.black)
                        }
                        .padding([.top, .bottom], 2)
                        .padding(.leading, 5)
                        .background(Color.white, alignment: .center)
                        .cornerRadius(5)
                        Spacer()
                        Button("Filtreler") {}
                            .padding(9)
                            .cornerRadius(5)
                            .foregroundColor(.gray)
                            .background(Color.gray)
                            .opacity(0.4)
                    }
                    .padding(.bottom, 5)
                    HStack {
                        NavigationLink(destination: PlaylistPage()) {
                            Image(systemName: "plus")
                                .clipShape(Rectangle())
                                .frame(width: 65, height: 65)
                                .background(darkGray)
                            Text("Çalma Listesi Oluştur")
                                .font(.headline)
                                .bold()
                                .padding(.leading, 10)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Image(systemName: "heart.fill")
                            .clipShape(Rectangle())
                            .frame(width: 65, height: 65)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple, .pink, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        VStack(alignment: .leading) {
                            Text("Beğenilen Şarkılar")
                                .font(.headline)
                                .bold()
                            Text("69 şarkı")
                                .font(.subheadline)
                                .opacity(0.7)
                        }
                        .padding(.leading, 10)
                        Spacer()
                    }
                    .padding(.bottom, 1)
                    ForEach(playlists) { playlist in
                        PlaylistRow(playlists: playlist) {
                            deletePlaylist(playlist)
                        }
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .onAppear {
                fetchPlaylists()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage))
            }
        }
    }

    private func fetchPlaylists() {
        guard let url = URL(string: "http://localhost:8080/api/playlist") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Playlist].self, from: data) {
                    DispatchQueue.main.async {
                        self.playlists = decodedResponse
                    }
                    return
                }
            }
            print("Hata: Veri alınamadı - \(error?.localizedDescription ?? "Bilinmeyen hata")")
        }.resume()
    }

    private func deletePlaylist(_ playlist: Playlist) {
        guard let playlistID = playlist.id else { return }
        guard let url = URL(string: "http://localhost:8080/api/playlist/\(playlistID.uuidString)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = data {
                DispatchQueue.main.async {
                    if let index = self.playlists.firstIndex(where: { $0.id == playlist.id }) {
                        self.playlists.remove(at: index)
                        self.showAlert = true
                        self.alertMessage = "Çalma listesi silindi"
                    }
                }
            } else {
                print("Hata: Silme işlemi başarısız - \(error?.localizedDescription ?? "Bilinmeyen hata")")
            }
        }.resume()
    }
}

struct PlaylistsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistsView()
    }
}
