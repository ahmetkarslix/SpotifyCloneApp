//
//  AlbumRow.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 16.06.2024.
//
import SwiftUI

struct AlbumRow: View {
    var albums: Album
    var body: some View {
        HStack{
            Image(albums.img)
                .resizable()
                .frame(width: 65, height: 65)
            VStack(alignment: .leading) {
                Text(albums.album)
                    .font(.headline).bold()
                    .padding(.leading, 5)
                Text(albums.artist)
                    .padding(.leading, 5)
                    .font(.subheadline)
                    .opacity(0.7)
            }
            Spacer()
        }
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow(albums: Album(id: UUID(), img: "album6", album: "Album 1", artistimg: "artist1", artist: "Artist 1", badge: false, year: "2024", date: "2024-06-17", songs: "10", time: "40:00", cright: "© 2024"))
    }
}
