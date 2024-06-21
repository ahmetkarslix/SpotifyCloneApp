//
//  UserDTO.swift
//  
//
//  Created by Ahmet Karslı on 20.05.2024.
//
import Vapor

struct UserDTO: Content {
    var name: String
    var email: String
    var password: String
    var gender: String
    var birthDate: String

    func toUser() -> User {
        let dateFormatter = ISO8601DateFormatter()
        let birthDate = dateFormatter.date(from: self.birthDate) ?? Date()
        return User(name: self.name, email: self.email, password: self.password, gender: self.gender, birthDate: birthDate)
    }
}
