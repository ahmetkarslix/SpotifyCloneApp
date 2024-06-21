//
//  PlaylistRow.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.05.2024.
//

import SwiftUI

struct PlaylistRow: View {
    var playlists: Playlist
    var onDelete: () -> Void

    var body: some View {
        HStack {
            Image(playlists.img)
                .resizable()
                .clipShape(Rectangle())
                .frame(width: 65, height: 65)
                .background(darkGray)
            VStack(alignment: .leading) {
                Text(playlists.name)
                    .font(.headline)
                    .bold()
                Text(playlists.creator)
                    .font(.subheadline)
                    .opacity(0.7)
            }
            .padding(.leading, 10)
            Spacer()
            Button(action: {
                onDelete() 
            }) {
                Image(systemName: "multiply.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
            }
        }
    }
}

struct PlaylistRow_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistRow(playlists: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify"), onDelete: {})
    }
}
