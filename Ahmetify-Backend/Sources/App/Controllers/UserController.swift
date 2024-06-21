//
//  UserController.swift
//
//
//  Created by Ahmet Karslı on 17.06.2024.
//

import Vapor
import Fluent
import Crypto

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.put(":id", use: updateUser)
        users.post("signup", use: create)
        users.post("login", use: login)
    }

    func create(req: Request) throws -> EventLoopFuture<User> {
        let userDTO = try req.content.decode(UserDTO.self)
        
        return User.query(on: req.db)
            .filter(\.$email == userDTO.email)
            .first()
            .flatMap { existingUser -> EventLoopFuture<User> in
                if let _ = existingUser {
                    return req.eventLoop.makeFailedFuture(Abort(.conflict, reason: "Bu e-posta adresi zaten kullanımda"))
                } else {
                    do {
                        let user = userDTO.toUser()
                        user.password = try Bcrypt.hash(user.password)
                        return user.save(on: req.db).map { user }
                    } catch {
                        return req.eventLoop.makeFailedFuture(error)
                    }
                }
            }
    }
    
    func login(req: Request) async throws -> HTTPStatus {
        let loginRequest = try req.content.decode(LoginRequest.self)
        guard let user = try await User.query(on: req.db)
            .filter(\.$email == loginRequest.email)
            .first() else {
                throw Abort(.unauthorized, reason: "Yanlış e-posta ya da şifre")
            }
        
        if try Bcrypt.verify(loginRequest.password, created: user.password) {
            return .ok
        } else {
            throw Abort(.unauthorized, reason: "Yanlış e-posta ya da şifre")
        }
    }
}

struct LoginRequest: Content {
    var email: String
    var password: String
}


    func updateUser(req: Request) throws -> EventLoopFuture<User> {
        let userId = try req.parameters.require("id", as: UUID.self)
        let updateData = try req.content.decode(UpdateUserData.self)
        
        return User.find(userId, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { user in
                user.name = updateData.name
                return user.save(on: req.db).map { user }
            }
    }

struct UpdateUserData: Content {
    var name: String
}

