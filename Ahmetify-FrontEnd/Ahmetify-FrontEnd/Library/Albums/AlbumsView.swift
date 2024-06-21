//
//  AlbumsView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 16.06.2024.
//

import SwiftUI

struct AlbumsView: View {
    @State var srch:String = ""
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView{
                HStack {
                    Spacer(minLength: 0)
                    HStack (alignment: .center,
                            spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(.black)
                            
                            .frame(minWidth: 0, maxWidth: 30)
                            .frame(minHeight: 0, maxHeight: 33)
                        
                        TextField ("Find in albums", text: $srch).frame(height: 20)
                    }  // HSTack
                    .padding([.top,.bottom], 2)
                    .padding(.leading, 5)
                    .background(Color.white, alignment: .center)
                    .cornerRadius(5)
                    Spacer()
                    Button("Filters"){
                    }.padding(9)
                    .cornerRadius(5)
                    .foregroundColor(.gray)
                    .background(Color.gray).opacity(0.4)
                }.padding(.bottom, 15)
                ForEach (0..<8){ index in
                    AlbumRow(albums: Album(id: UUID(), img: "album6", album: "Album 1", artistimg: "artist1", artist: "Artist 1", badge: false, year: "2024", date: "2024-06-17", songs: "10", time: "40:00", cright: "© 2024"))
                }
                Spacer()
            }
        }.foregroundColor(.white)
    }
}

struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsView()
    }
}
