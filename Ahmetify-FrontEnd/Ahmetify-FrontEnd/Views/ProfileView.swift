//
//  ProfileView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 16.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = "Ahmet"
    @State private var lastName: String = "Karslı"
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var showPhotoPicker = false
    @State private var selectedImage: String = "Profile"
    let userId: String = "a529eeab-7238-4c0b-b5cd-7559e40f8bd9"

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image(selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding(.bottom)
                
                Button(action: {
                    showPhotoPicker = true
                }) {
                    Text("Fotoğrafı Değiştir")
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $showPhotoPicker) {
                    PhotoPickerView(selectedImage: $selectedImage, showModal: $showPhotoPicker)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("İsim :")
                            .foregroundColor(.white)
                            .padding(.leading,18)
                        Spacer()
                    }
                    TextField("İsim", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    HStack {
                        Text("Soy İsim :")
                            .foregroundColor(.white)
                            .padding(.leading,18)
                        Spacer()
                    }
                    TextField("Soy İsim", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    saveProfile()
                }) {
                    Text("Kaydet")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(Capsule())
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Bilgi"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
                }
            }
        }
        .navigationBarTitle("Profil Düzenle")
    }

    func saveProfile() {
        guard let url = URL(string: "http://localhost:8080/users/\(userId)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let fullName = "\(firstName) \(lastName)"
        let body: [String: Any] = ["name": fullName, "photo": selectedImage]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.alertMessage = "Hata: \(error.localizedDescription)"
                    self.showAlert = true
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.alertMessage = "Sunucudan veri alınamadı."
                    self.showAlert = true
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    self.alertMessage = "Profil başarıyla güncellendi."
                    self.showAlert = true
                }
            } else {
                let message = String(data: data, encoding: .utf8) ?? "Bilinmeyen hata"
                DispatchQueue.main.async {
                    self.alertMessage = "Hata: \(message)"
                    self.showAlert = true
                }
            }
        }.resume()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
