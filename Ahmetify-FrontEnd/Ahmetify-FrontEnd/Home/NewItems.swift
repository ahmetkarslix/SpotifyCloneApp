//
//  NewItems.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import SwiftUI

struct NewItems: View {
    var album: Album
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color(.darkGray)
                HStack {
                    Image(album.img)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                    
                    Text(album.album)
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                    Spacer()
                    if album.badge {
                        Image(systemName: "circlebadge.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 7, height: 7)
                            .aspectRatio(contentMode: .fit)
                            .padding(.trailing, 5)
                    } else {
                        Spacer()
                    }
                }
            }
        }
        .frame(width: 190, height: 60, alignment: .leading)
        .cornerRadius(5)
    }
}

struct NewItems_Previews: PreviewProvider {
    static var previews: some View {
        NewItems(album: Album(id: UUID(), img: "album1", album: "#1", artistimg: "album1", artist: "Lvbel C5", badge: false, year: "2024", date: "Nisan 12", songs: "6", time: "12 dk 24sn", cright: "© ℗ 2024 Mundo Music"))
        
    }
}
