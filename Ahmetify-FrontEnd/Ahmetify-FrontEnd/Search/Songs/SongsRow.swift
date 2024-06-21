//
//  SongsRow.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 19.06.2024.
//

import SwiftUI

struct SongsRow: View {
    var song: Song
    
    var body: some View {
        HStack {
            Image(song.img)
                .resizable()
                .frame(width: 45, height: 45)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(song.name)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                
                Text("Şarkı * \(song.artist)")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.gray) 
        .cornerRadius(10)
    }
}

struct SongsRow_Previews: PreviewProvider {
    static var previews: some View {
        SongsRow(song: Song(id: UUID(), img: "album1", name: "#1", artist: "Lvbel C5"))
            .previewLayout(.fixed(width: 300, height: 70))
            .background(Color.black)
    }
}
