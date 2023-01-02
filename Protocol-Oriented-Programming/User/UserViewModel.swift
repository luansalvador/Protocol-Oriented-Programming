//
//  UserViewModel.swift
//  Protocol-Oriented-Programming
//
//  Created by Luan Henrique Salvador Amorim on 01/01/23.
//

import Foundation

protocol UserViewModelDelegate: AnyObject {
    
    func updateView(imageUrl: String,
                    email: String)
}

class UserViewModel {
    
    weak var delegate: UserViewModelDelegate?
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUser() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.updateView(imageUrl: user.avatar, email: user.email)
            case .failure:
                let errorImageUrl = "https://cdn1.iconfinder.com/data/icons/user-fill-icons-set/144/User003_Error-1024.png"
                self?.delegate?.updateView(imageUrl: errorImageUrl, email: "No user found")
            }
        }
    }
}
