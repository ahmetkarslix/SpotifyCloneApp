//
//  PlaylistPage.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import SwiftUI

struct PlaylistPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var playlistName: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text("Çalma listesine bir isim ver:")
                .foregroundColor(.white)
                .padding()
            
            TextField("Çalma Listesinin Adı", text: $playlistName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                createPlaylist()
            }) {
                Text("Oluştur")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertMessage))
            }
            
            Spacer()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationTitle("Yeni Playlist")
    }
    
    func createPlaylist() {
        guard !playlistName.isEmpty else { return }
        
        let newPlaylist = PlaylistRequest(img: "blankplaylist", name: playlistName, genre: "mixed", creator: "Ahmet Karslı")
        
        guard let url = URL(string: "http://localhost:8080/api/playlist") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(newPlaylist)
            request.httpBody = jsonData
        } catch {
            print("JSON encoding failed: \(error)")
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("HTTP request failed: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                DispatchQueue.main.async {
                    self.showAlert = true
                    self.alertMessage = "Çalma Listesi Oluşturuldu"
                    self.presentationMode.wrappedValue.dismiss()
                }
            } else {
                print("HTTP request failed with response: \(response.debugDescription)")
            }
        }.resume()
        print("Post isteği başarıyla kaydedildi")
    }
}

struct PlaylistRequest: Codable {
    var img: String
    var name: String
    var genre: String
    var creator: String
}

struct PlaylistPage_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistPage()
    }
}
