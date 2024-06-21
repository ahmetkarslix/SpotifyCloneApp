//
//  User.swift
//  Ahmetify-FrontEnd
//
//  Created by Ahmet Karslı on 20.05.2024.
//

import Foundation

struct User: Codable {
    var id: UUID?
    var name: String
    var email: String
    var gender: String
    var birthDate: Date
}
