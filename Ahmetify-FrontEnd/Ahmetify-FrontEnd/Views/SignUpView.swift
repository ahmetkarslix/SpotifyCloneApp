//
//  SignUpView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 16.05.2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedGender: String = "Erkek"
    @State private var birthDate: Date = Date()
    @State private var isRegistered: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("SignUpLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .padding(.top)
                Spacer(minLength: 10)

                TextField("e-posta", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("İsim", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Şifre", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                DatePicker("Doğum Tarihi:", selection: $birthDate, displayedComponents: .date)
                    .padding()
                    .foregroundColor(.green)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Picker("Cinsiyet", selection: $selectedGender) {
                    Text("Erkek").tag("Erkek")
                    Text("Kadın").tag("Kadın")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Spacer()

                Button(action: {
                    signUp()
                }) {
                    Text("Kayıt Ol")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding()

                Text("Hesabınız var mı?")
                    .padding(.top)

                NavigationLink(destination: LoginView()) {
                    Text("Giriş Yap")
                        .foregroundColor(.green)
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Mesaj"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("Tamam"), action: {
                        if alertMessage == "Kayıt başarılı" {
                            isRegistered = true
                        }
                    })
                )
            }
            .background(
                NavigationLink(
                    destination: LoginView(),
                    isActive: $isRegistered,
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
    }

    func signUp() {
        if !isValidEmail(email) {
            alertMessage = "Kayıt Başarısız: Geçersiz e-posta"
            showAlert = true
            return
        }

        guard let url = URL(string: "http://localhost:8080/users/signup") else {
            print("Geçersiz URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let userDTO = UserDTO(name: name, email: email.lowercased(), password: password, gender: selectedGender, birthDate: birthDate)

        guard let encoded = try? JSONEncoder().encode(userDTO) else {
            print("Kullanıcı kodlanamadı")
            return
        }
        request.httpBody = encoded

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    alertMessage = "Kayıt Başarısız: \(error.localizedDescription)"
                    showAlert = true
                }
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Yanıt Durum Kodu: \(httpResponse.statusCode)")
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {
                        alertMessage = "Kayıt başarılı"
                        showAlert = true
                    }
                } else {
                    DispatchQueue.main.async {
                        alertMessage = "Sunucu hatası: \(httpResponse.statusCode)"
                        showAlert = true
                    }
                    print("Sunucu hatası: \(httpResponse.statusCode)")
                }
            }
        }.resume()
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
