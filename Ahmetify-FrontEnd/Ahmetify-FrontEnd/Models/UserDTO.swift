//
//  UserDTO.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.05.2024.
//
import Foundation

struct UserDTO: Codable {
    var name: String
    var email: String
    var password: String
    var gender: String
    var birthDate: String

    init(name: String, email: String, password: String, gender: String, birthDate: Date) {
        self.name = name
        self.email = email
        self.password = password
        self.gender = gender
        let dateFormatter = ISO8601DateFormatter()
        self.birthDate = dateFormatter.string(from: birthDate)
    }
}
