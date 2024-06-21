//
//  AdminPage.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 18.05.2024.
//

import SwiftUI

struct AdminPage: View {
    @State private var selectedUser: String = "Kullanıcı Seç"
    @State private var selectedSong: String = "Şarkı Seç"
    @State private var updateingSong: String = "Yüklencek Şarkı"
    @State private var newSongName: String = ""
    @State private var selectedFile: URL?
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                HStack {
                    Text("Kullanıcı Hesabı:")
                        .foregroundColor(.white)
                    Spacer()
                    Text(selectedUser)
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack {
                    Button(action: {
                    }) {
                        Text("Güncelle")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                    }) {
                        Text("Sil")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                
                Picker("Şarkı Seç", selection: $selectedSong) {
                    Text("Şarkı Seç").tag("Şarkı Seç")
                }
                .pickerStyle(SegmentedPickerStyle())
                .foregroundColor(.white)
                .padding()
                
                HStack {
                    Button(action: {
                    }) {
                        Text("Şarkı Sil")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                
                TextField("Şarkı Adı", text: $newSongName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                }) {
                    Text("Şarkı Güncelle")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                Picker("Dosya Seç", selection: $updateingSong) {
                    Text("Dosya Seç").tag("Dosya Seç")
                }
                Button(action: {
                }) {
                    Text("Şarkı Ekle")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarTitle("Admin Paneli")
    }
}

struct AdminPage_Previews: PreviewProvider {
    static var previews: some View {
        AdminPage()
    }
}
