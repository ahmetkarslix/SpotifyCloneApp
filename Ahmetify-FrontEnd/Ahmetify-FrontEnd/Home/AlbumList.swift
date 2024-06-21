//
//  AlbumList.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import SwiftUI

struct AlbumList: View {
    var album: Album
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Image(album.img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                Text(album.album)
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .padding(.top, 2)
                Text("Albüm - \(album.artist)")
                    .foregroundColor(.white)
                    .font(.system(size: 13))
                    .padding(.top,1)
            }
        }
    }
}

struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList(album: Album(id: UUID(), img: "album6", album: "Album 1", artistimg: "artist1", artist: "Artist 1", badge: false, year: "2024", date: "2024-06-17", songs: "10", time: "40:00", cright: "© 2024"))
    }
}
