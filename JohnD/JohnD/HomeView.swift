//
//  HomeView.swift
//  JohnD
//
//  Created by Jeff Haley on 9/16/23.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func buttonTapped()
}

class HomeView: UIView {
    var skullImageView: UIImageView
    var colorChangeButton: UIButton
    weak var delegate: HomeViewDelegate?

    init(delegate: HomeViewDelegate) {
        skullImageView = {
            var imageView = UIImageView(image: UIImage(named: "skull"))
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        colorChangeButton = {
            var button = UIButton()
            button.setTitle("Color", for: .normal)
            button.backgroundColor = .red
            button.layer.cornerRadius = 12
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        super.init(frame: .zero)
        addSubviews()
        addConstraints()
        backgroundColor = .black
        self.delegate = delegate
        colorChangeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(skullImageView)
        addSubview(colorChangeButton)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            skullImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            skullImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            skullImageView.widthAnchor.constraint(equalToConstant: 100),
            skullImageView.heightAnchor.constraint(equalToConstant: 200),

            colorChangeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            colorChangeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            colorChangeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120),
            colorChangeButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    @objc
    func buttonTapped() {
        delegate?.buttonTapped()
    }
}
