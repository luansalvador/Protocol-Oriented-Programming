//
//  APIManager.swift
//  Protocol-Oriented-Programming
//
//  Created by Luan Henrique Salvador Amorim on 01/01/23.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}

class APIManager: UserService {
    
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let url = URL(string: "https://reqres.in/api/users/4") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode(UserResponse.self, from: data).data {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }    
}
