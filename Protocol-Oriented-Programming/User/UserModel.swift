//
//  UserModel.swift
//  Protocol-Oriented-Programming
//
//  Created by Luan Henrique Salvador Amorim on 01/01/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let avatar: String
}

struct UserResponse: Codable {
    let data: User
}
