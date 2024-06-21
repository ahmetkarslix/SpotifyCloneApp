//
//  LoginView.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String?
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Image("LoginPageLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()

                TextField("E-posta", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Şifre", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    login()
                }) {
                    Text("Giriş Yap")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(8)
                }
                .padding(.bottom, 10.0)
                .disabled(email.isEmpty || password.isEmpty)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Text("Hesabınız yok mu?")
                
                NavigationLink(destination: SignUpView()) {
                    Text("Kayıt Ol")
                        .foregroundColor(.green)
                }
                .padding()

                NavigationLink(destination: AdminPage()) {
                    Text("Yönetici hesabı ile giriş yap")
                        .foregroundColor(.green)
                }
                .padding()
                
                Spacer()
                
                NavigationLink(
                    destination: ContentView(),
                    isActive: $isLoggedIn,
                    label: { EmptyView() }
                )
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Hata"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
            }
        }
    }

    func login() {
        guard let url = URL(string: "http://localhost:8080/users/login") else {
            print("Geçersiz URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginRequest = LoginRequest(email: email.lowercased(), password: password)
        
        guard let encoded = try? JSONEncoder().encode(loginRequest) else {
            print("Login kodlanamadı")
            return
        }
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Hata: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, let data = data {
                DispatchQueue.main.async {
                    if httpResponse.statusCode == 200 {
                        isLoggedIn = true
                    } else {
                        let decoder = JSONDecoder()
                        if let errorResponse = try? decoder.decode(ErrorResponse.self, from: data) {
                            errorMessage = errorResponse.error
                            handleLoginError(error: errorResponse.error)
                        } else {
                            alertMessage = "Bilinmeyen bir hata oluştu"
                            showAlert = true
                        }
                    }
                }
            }
        }.resume()
    }
    
    func handleLoginError(error: String) {
        if error.contains("email") {
            alertMessage = "E-posta geçersiz ve yanlış"
        } else if error.contains("password") {
            alertMessage = "Şifre yanlış"
        } else {
            alertMessage = "Bilinmeyen bir hata oluştu"
        }
        showAlert = true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginRequest: Codable {
    var email: String
    var password: String
}

struct ErrorResponse: Codable {
    var error: String
}
