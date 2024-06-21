//
//  SearchView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import SwiftUI

func random() -> Color {
    let red = Double.random(in: 0 ... 1)
    let green = Double.random(in: 0 ... 1)
    let blue = Double.random(in: 0 ... 1)
    return Color(red: red, green: green, blue: blue)
}

struct SearchView: View {
    var mainPlaylists: Playlist
    @State private var searchText: String = ""
    @State private var navigateToSearchPage = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Arama")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 5)
                        
                        NavigationLink(destination: SearchPage(searchText: searchText), isActive: $navigateToSearchPage) {
                            EmptyView()
                        }
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                                .padding(.leading, 5)
                            
                            TextField("Şarkıcı, Şarkı Ara", text: $searchText, onCommit: {
                                navigateToSearchPage = true
                            })
                                .frame(height: 35)
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                        }
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        .cornerRadius(5)
                        
                        Text("Senin Tarzın")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                        HStack {
                            Spacer()
                            GenreView(playlist: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify"))
                            GenreView(playlist: Playlist(img: "playlist2", name: "Pop", genre: "Pop", creator: "Spotify"))
                            GenreView(playlist: Playlist(img: "playlist3", name: "Hip Hop", genre: "Hip Hop", creator: "Spotify"))
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        HStack {
                            GenreView(playlist: Playlist(img: "playlist4", name: "Ruh Hali", genre: "Indie", creator: "Spotify"))
                                .padding(.leading, 10)
                            Spacer()
                        }
                        
                        Text("Keşfet")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        ForEach(0..<5) { _ in
                            HStack {
                                Spacer()
                                GenreView(playlist: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify"))
                                GenreView(playlist: Playlist(img: "playlist2", name: "Pop", genre: "Pop", creator: "Spotify"))
                                GenreView(playlist: Playlist(img: "playlist3", name: "Hip Hop", genre: "Hip Hop", creator: "Spotify"))
                                Spacer()
                            }
                            .padding(.bottom, 5)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(mainPlaylists: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify"))
    }
}
