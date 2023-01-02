//
//  UserView.swift
//  Protocol-Oriented-Programming
//
//  Created by Luan Henrique Salvador Amorim on 01/01/23.
//

import UIKit

class UserView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        setupAdditionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(imageView)
        self.addSubview(emailLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: 100),
            self.imageView.widthAnchor.constraint(equalToConstant: 100),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            
            self.emailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.emailLabel.heightAnchor.constraint(equalToConstant: 56),
            self.emailLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupAdditionalConfig() {
        self.backgroundColor = .white
    }
    
    public func setImage(image: UIImage) {
        self.imageView.image = image
    }
    
    public func setText(text: String) {
        self.emailLabel.text = text
    }
}
