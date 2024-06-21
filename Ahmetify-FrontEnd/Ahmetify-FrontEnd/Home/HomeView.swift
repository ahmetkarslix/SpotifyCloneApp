//
//  HomeView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.06.2024.
//

import SwiftUI

let AlbumImageList = ["album1", "album2", "album3", "album4", "album5", "album6","album7","album8"]
let AlbumTitleList = ["#1", "Dale", "Habibi", "Antroposen 002", "Sirenler", "Karışık Kaset", "Canın Sağ Olsun","LAF"]
let AlbumArtistList = ["Lvbel C5", "Astral • Organize", "BLOK3 • Stefflon Don", "maNga", "mor ve ötesi", "Semicenk", "Single By Semicenk • Rast","BLOK3"]

struct HomeView: View {
    var mainAlbums: Album
    var mainPodcasts: Podcast
    var semicenkdeets: AlbumDetails = AlbumDetails(id: UUID(), title: "Kısmetim Kapanmış", artists: "Semicenk")
    
    init(mainAlbums: Album, mainPodcasts: Podcast) {
        UIScrollView.appearance().bounces = false
        self.mainAlbums = mainAlbums
        self.mainPodcasts = mainPodcasts
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                ScrollView {
                    ZStack {
                        LinearGradient(gradient: Gradient(stops: [.init(color: .gray, location: 0.0), .init(color: .black, location: 0.25), .init(color: .black, location: 0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea(.all)
                        VStack(alignment: .center) {
                            HStack {
                                Text("Günaydın AHMET")
                                    .foregroundColor(.white)
                                    .font(.system(size: 23))
                                    .fontWeight(.bold)
                                    .padding()
                                Spacer()
                                NavigationLink(destination: ProfileView()) {
                                    Image("Profile")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 23, height: 23)
                                }
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                                    .frame(width: 23, height: 23)
                                    .padding(.leading, 10)
                            }
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                            .padding(.bottom, 20)
                            
                            HStack {
                                Spacer(minLength: 20)
                                VStack {
                                    HStack {
                                        NewItems(album: Album(id: UUID(), img: "album1", album: "#1", artistimg: "album1", artist: "Lvbel C5", badge: false, year: "2024", date: "Nisan 12", songs: "6", time: "12 dk 24 sn", cright: "© ℗ 2024 Mundo Music"))
                                        NewItems(album: Album(id: UUID(), img: "album2", album: "Dale", artistimg: "album2", artist: "Astral • Organize", badge: false, year: "2024", date: "Nisan 12", songs: "1", time: "2 dk 19 sn", cright: "© ℗ Önal Production"))
                                    }
                                    HStack {
                                        NewItems(album: Album(id: UUID(), img: "album3", album: "Habibi", artistimg: "album3", artist: "BLOK3 • Stefflon Don", badge: false, year: "2024", date: "Mayıs 10", songs: "1", time: "2 dk 40 sn", cright: "© ℗ Real Paperboys, Mundo Music, Under Exclusive License to GRADUATION*"))
                                        NewItems(album: Album(id: UUID(), img: "album4", album: "Antroposen 002", artistimg: "album4", artist: "maNga", badge: false, year: "2023", date: "Aralık 14", songs: "6", time: "29 dk 41 sn", cright: "© ℗ Doğan Müzik Yapım"))
                                    }
                                    HStack {
                                        NewItems(album: Album(id: UUID(), img: "album5", album: "Sirenler", artistimg: "album5", artist: "mor ve ötesi", badge: false, year: "2022", date: "Ocak 21", songs: "11", time: "52 dk 9 sn", cright: "© ℗ 2024 Rakun Müzik"))
                                        NewItems(album: Album(id: UUID(), img: "album6", album: "Karışık Kaset", artistimg: "album6", artist: "Semicenk", badge: false, year: "2023", date: "Aralık 15", songs: "6", time: "24 dk 5 sn", cright: "© ℗ Eva Records & DMC"))
                                    }
                                }
                                Spacer(minLength: 20)
                            }
                            HStack {
                                Image("album6")
                                    .resizable()
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                VStack(alignment: .leading) {
                                    Text("BENZER ŞARKILARI KEŞFET")
                                        .font(.system(size: 10))
                                        .tracking(1)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                    Text("Semicenk")
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                }
                                Spacer()
                            }
                            .padding()
                            .padding(.bottom, -10)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .top) {
                                    AlbumList(album: Album(id: UUID(), img: "album1", album: "#1", artistimg: "album1", artist: "Lvbel C5", badge: false, year: "2024", date: "Nisan 12", songs: "6", time: "12 dk 24 sn", cright: "© ℗ 2024 Mundo Music"))
                                    AlbumList(album: Album(id: UUID(), img: "album2", album: "Dale", artistimg: "album2", artist: "Astral • Organize", badge: false, year: "2024", date: "Nisan 12", songs: "1", time: "2 dk 19 sn", cright: "© ℗ Önal Production"))
                                    AlbumList(album: Album(id: UUID(), img: "album3", album: "Habibi", artistimg: "album3", artist: "BLOK3 • Stefflon Don", badge: false, year: "2024", date: "Mayıs 10", songs: "1", time: "2 dk 40 sn", cright: "© ℗ Real Paperboys, Mundo Music, Under Exclusive License to GRADUATION*"))
                                    AlbumList(album: Album(id: UUID(), img: "album4", album: "Antroposen 002", artistimg: "album4", artist: "maNga", badge: false, year: "2023", date: "Aralık 14", songs: "6", time: "29 dk 41 sn", cright: "© ℗ Doğan Müzik Yapım"))
                                    AlbumList(album: Album(id: UUID(), img: "album5", album: "Sirenler", artistimg: "album5", artist: "mor ve ötesi", badge: false, year: "2022", date: "Ocak 21", songs: "11", time: "52 dk 9 sn", cright: "© ℗ 2024 Rakun Müzik"))
                                    AlbumList(album: Album(id: UUID(), img: "album6", album: "Karışık Kaset", artistimg: "album6", artist: "Semicenk", badge: false, year: "2023", date: "Aralık 15", songs: "6", time: "24 dk 5 sn", cright: "© ℗ Eva Records & DMC"))
                                }
                            }
                            .padding(.leading)
                            .padding(.trailing)
                            
                            HStack {
                                Text("Podcastler")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .top) {
                                    PodList(podcasts: Podcast(id: UUID(), img: "Podcast6", podcast: "Konuşmazsak Delircez", episode: "Denge: Tutamıyorum Zamanı", network: "Aliye Network", time: "Pzr", timeleft: 40, duration: 47, description: "Herkes gitti ben mi kaldım?(ben kaldım kardeş ben kaldım)"))
                                    podlist(img: "Podcast1", name: "Anlatamadım", network: "Anlatamadım Network")
                                    podlist(img: "Podcast2", name: "KALT'ın Podcast'i", network: "KALT Network")
                                    podlist(img: "Podcast3", name: "Biraz Konuşabilir miyiz?", network: "Biraz Konuşabilir miyiz?")
                                    podlist(img: "Podcast4", name: "Dersimiz Fitness", network: "Dersimiz Fitness Network")
                                    podlist(img: "Podcast6", name: "Konuşmazsak Delircez", network: "Aliye Network")
                                }
                                .padding(.leading)
                                .padding(.trailing)
                            }
                            Spacer()
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 100)
                    }
                }
                .ignoresSafeArea()
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(mainAlbums: Album(id: UUID(), img: "album6", album: "Album 1", artistimg: "artist1", artist: "Artist 1", badge: false, year: "2024", date: "2024-06-17", songs: "10", time: "40:00", cright: "© 2024"),
                 mainPodcasts: Podcast(id: UUID(), img: "Podcast6", podcast: "Konuşmazsak Delircez", episode: "Denge: Tutamıyorum Zamanı", network: "Aliye Network", time: "Pzr", timeleft: 40, duration: 47, description: "Herkes gitti ben mi kaldım?(ben kaldım kardeş ben kaldım)"))
    }
}

func podlist(img: String, name: String, network: String) -> some View {
    return VStack(alignment: .leading) {
        Image(img)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150)
        Text(name)
            .foregroundColor(.white)
            .font(.system(size: 17))
            .fontWeight(.semibold)
            .padding(.top, 2)
        Text("Gösterim - \(network)")
            .foregroundColor(.white)
            .font(.system(size: 13))
            .padding(.top, 1)
    }
    .frame(width: 150)
}
