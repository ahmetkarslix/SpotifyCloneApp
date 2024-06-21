//
//  GenreView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import SwiftUI

struct GenreView: View {
    var playlist : Playlist
    var body: some View {
        ZStack(alignment: .leading){
            LinearGradient(gradient: Gradient(colors: [random()]), startPoint: .leading, endPoint: .trailing)
            HStack(alignment: .top){
                Text(playlist.genre)
                    .font(.system(size: 14))
                    .kerning(0)
                    .fontWeight(.bold)
                    .padding(.leading,10)
                    .padding(.top,-15)
                Spacer()
                Image(playlist.img)
                    .resizable()
                    .frame(width: 50,height: 50)
                    .rotationEffect(.degrees(25))
                    .padding(.trailing,-18)
                    .padding(.bottom,-20)
            }
        }
        .frame(width: 120,height: 70)
        .clipShape(Rectangle())
        .cornerRadius(5)
    }
}

#Preview {
    GenreView(playlist: Playlist(img: "playlist1", name: "Müzik", genre: "All", creator: "Spotify"))
}
