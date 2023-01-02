//
//  ViewController.swift
//  Protocol-Oriented-Programming
//
//  Created by Luan Henrique Salvador Amorim on 01/01/23.
//

import UIKit

class UserViewController: UIViewController {
    
    private let userView: UserView
    private var userViewModel: UserViewModel
    
    init(userView: UserView,viewModel: UserViewModel) {
        self.userViewModel = viewModel
        self.userView = userView
        super.init(nibName: nil, bundle: nil)
        self.userViewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchUsers()
    }
    
    private func configureView() {
        self.view = userView
    }

    private func fetchUsers() {
        userViewModel.fetchUser()
    }
}

extension UserViewController: UserViewModelDelegate {
    func updateView(imageUrl: String, email: String) {
        let imageData = try! NSData(contentsOf: .init(string: imageUrl)!) as Data
        self.userView.setImage(image: UIImage(data: imageData) ?? UIImage())
        self.userView.setText(text: email)
    }    
}

