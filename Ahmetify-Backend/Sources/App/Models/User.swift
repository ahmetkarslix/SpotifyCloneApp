//
//  User.swift
//  
//
//  Created by Ahmet Karslı on 20.05.2024.
//

import Fluent
import Vapor

final class User: Model, Content {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "email")
    var email: String

    @Field(key: "password")
    var password: String

    @Field(key: "gender")
    var gender: String

    @Field(key: "birthDate")
    var birthDate: Date

    init() { }

    init(id: UUID? = nil, name: String, email: String, password: String, gender: String, birthDate: Date) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.gender = gender
        self.birthDate = birthDate
    }
}
