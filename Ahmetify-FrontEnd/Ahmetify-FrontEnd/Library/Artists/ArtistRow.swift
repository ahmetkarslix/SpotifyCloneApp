//
//  ArtistRow.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 16.06.2024.
//

import SwiftUI

struct ArtistRow: View {
    var albums: Album
    var body: some View {
        HStack{
            Image(albums.artistimg)
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 65, height: 65)
            Text(albums.artist)
                .font(.headline).bold()
                .padding(.leading, 10)
            Spacer()
                
        }
    }
}

struct ArtistRow_Previews: PreviewProvider {
    static var previews: some View {
        ArtistRow(albums: Album(id: UUID(), img: "album6", album: "Album 1", artistimg: "artist1", artist: "Artist 1", badge: false, year: "2024", date: "2024-06-17", songs: "10", time: "40:00", cright: "© 2024"))
    }
}
