//
//  LibraryView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.05.2024.
//

import SwiftUI

var darkGray = Color(red: 0.15, green: 0.15, blue: 0.15)

struct LibraryView: View {
    @State var srch: String = ""
    @State var libIndex: Int = 0
    @State var showingPlaylistCreation = false
    @State var newPlaylistName = ""

    var body: some View {

        ZStack(alignment: .leading){
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    if(self.libIndex<3) {
                        Button("Müzik"){
                            self.libIndex=0
                        }.font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    }
                    else
                    {
                        Button("Müzik"){
                            self.libIndex=0
                        }.font(.system(size: 35, weight: .bold))
                        .foregroundColor(.gray)
                    }
                    if(self.libIndex>=3) {
                        Button("Podcastler"){
                            self.libIndex=3
                        }.font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    }
                    else
                    {
                        Button("Podcastler"){
                            self.libIndex=3
                        }.font(.system(size: 35, weight: .bold))
                        .foregroundColor(.gray)
                    }
                }
                .padding(.bottom, 10)
                
                if (self.libIndex == 0 || libIndex==1 || libIndex == 2)
                {
                    HStack(alignment: .top, spacing: 30){
                        VStack(alignment: .center){
                            if (self.libIndex==0) {
                                Button("Playlistler"){
                                    withAnimation{
                                        self.libIndex=0
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                Rectangle()
                                    .frame(width: 89, height: 3)
                                    .foregroundColor(.green)
                                    .transition(.slide)
                            }
                            else {
                                Button("Playlistler"){
                                    withAnimation{
                                        self.libIndex=0
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                                .transition(.slide)
                            }
                        }
                        VStack{
                            if (self.libIndex==1){
                                Button("Şarkıcılar"){
                                    withAnimation{
                                        self.libIndex=1
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                Rectangle()
                                    .frame(width: 65, height: 3)
                                    .foregroundColor(.green)
                            }
                            else {
                                Button("Şarkıcılar"){
                                    withAnimation{
                                        self.libIndex=1
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                            }
                        }
                        VStack{
                            if (self.libIndex==2){
                                Button("Albümler"){
                                    withAnimation{
                                        self.libIndex=2
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                Rectangle()
                                    .frame(width: 75, height: 3)
                                    .foregroundColor(.green)
                            }
                            else {
                                Button("Albümler"){
                                    withAnimation{
                                        self.libIndex=2
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                            }
                        }
                        
                    }.foregroundColor(.white)
                    .padding(.bottom, 10)
                }
                else if (self.libIndex==3 || self.libIndex==4 || self.libIndex==5)
                {
                    HStack(alignment: .top, spacing: 30){
                        VStack(alignment: .center){
                            if (self.libIndex==3) {
                                Button("Bölümler"){
                                    withAnimation{
                                        self.libIndex=3
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                
                                Rectangle()
                                    .frame(width: 79, height: 3)
                                    .foregroundColor(.green)
                                    .transition(.slide)
                            }
                            else {
                                Button("Bölümler"){
                                    withAnimation{
                                        self.libIndex=3
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                                .transition(.slide)
                            }
                        }
                        VStack(){
                            if (self.libIndex==4){
                                Button("İndirilenler"){
                                    withAnimation{
                                        self.libIndex=4
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                Rectangle()
                                    .frame(width: 100,height: 3)
                                    .foregroundColor(.green)
                            }
                            else {
                                Button("İndirilenler"){
                                    withAnimation{
                                        self.libIndex=4
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                            }
                        }.frame(width: 100)
                        VStack{
                            if (self.libIndex==5){
                                Button("Şovlar"){
                                    withAnimation{
                                        self.libIndex=5
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                Rectangle()
                                    .frame(width: 75, height: 3)
                                    .foregroundColor(.green)
                            }
                            else {
                                Button("Şovlar"){
                                    withAnimation{
                                        self.libIndex=5
                                    }
                                }.font(.system(size: 17, weight: .bold))
                                .foregroundColor(.gray)
                            }
                        }
                        
                    }.foregroundColor(.white)
                    .padding(.bottom, 10)
                }
                
                switch self.libIndex{
                case 0:
                    VStack{
                        PlaylistsView().transition(.slide)
                    }
                case 1:
                    VStack{
                        ArtistsView()
                            .transition(.slide)
                    }
                case 2:
                    VStack{
                        AlbumsView()
                            .transition(.slide)
                    }
                case 3:
                    VStack{
                        EpisodesView()
                            .transition(.slide)
                    }
                case 4:
                    VStack{
                        DownloadsView()
                            .transition(.slide)
                    }
                case 5:
                    VStack{
                        ShowsView().transition(.slide)
                    }
                default:
                    VStack{
                        PlaylistsView()
                            .transition(.slide)
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}

