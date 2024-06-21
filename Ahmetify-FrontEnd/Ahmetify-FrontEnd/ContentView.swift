//
//  ContentView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 16.05.2024.
//
import SwiftUI

struct ContentView: View {
    
    let darkGray : Color = Color(red:0.15,green: 0.15,blue: 0.15)
    init(){
        UITabBar.appearance().barTintColor = .black
        
    }
    
    var body: some View {
        TabView{
            HomeView(mainAlbums: Album(id: UUID(), img: "album1", album: "#1", artistimg: "album1", artist: "Lvbel C5", badge: false, year: "2024", date: "Nisan 12", songs: "6", time: "12 dk 24 sn", cright: "© ℗ 2024 Mundo Music"), mainPodcasts: Podcast(id: UUID(), img: "Podcast6", podcast: "Konuşmazsak Delircez", episode: "Denge: Tutamıyorum Zamanı", network: "Aliye Network", time: "Pzr", timeleft: 40, duration: 47, description: "Herkes gitti ben mi kaldım?(ben kaldım kardeş ben kaldım)"))
                .tabItem {
                    Image(systemName: "house")
                    Text("Ana Sayfa")
                }.tag(0)
            
            SearchView(mainPlaylists: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify"))
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Arama")
                }.tag(1)
            
            LibraryView()
                    .tabItem {
                        Image(systemName: "books.vertical")
                        Text("Kitaplığın")
                }.tag(2)
        }
        .accentColor(.white)
        .preferredColorScheme(.dark)
    }
}

    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
