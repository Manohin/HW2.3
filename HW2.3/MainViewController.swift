//
//  MainViewController.swift
//  HW2.3
//
//  Created by Alexey Manokhin on 16.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    lazy var photoImageView = {
        let imageView = UIImageView(image: UIImage(named: "photo"))
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var fullNameLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica-bold", size: 20)
        label.text = "Имя Фамилия"
        return label
    }()
    
    lazy var aboutMeLabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-bold", size: 12)
        label.text = "О себе"
        return label
    }()
    
    lazy var textBackgroundView = {
        let view = UIView()
        view.backgroundColor = UIColor(
            red: 232 / 255,
            green: 232 / 255,
            blue: 232 / 255,
            alpha: 1
        )
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var aboutMeTextLabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 12)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var photosLabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-bold", size: 12)
        label.text = "Фото"
        return label
    }()
    
    lazy var firstPhotoCollectionImageView = {
        let imageView = UIImageView(image: UIImage(named: "firstImage"))
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var secondPhotoCollectionImageView = {
        let imageView = UIImageView(image: UIImage(named: "secondImage"))
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var editButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.073, green: 0.318, blue: 0.794, alpha: 1)
        button.layer.cornerRadius = 20
        button.setTitle("Редактировать", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        textBackgroundView.addSubview(aboutMeTextLabel)
        setupViews()
    }
    
    private func setupViews() {
        [photoImageView,
         fullNameLabel,
         aboutMeLabel,
         textBackgroundView,
         photosLabel,
         firstPhotoCollectionImageView,
         secondPhotoCollectionImageView,
         editButton
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 79),
            photoImageView.widthAnchor.constraint(equalToConstant: 80),
            photoImageView.heightAnchor.constraint(equalToConstant: 80),
            photoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 19),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 119),
            fullNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            aboutMeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41),
            aboutMeLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 39),
            
            textBackgroundView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 7),
            textBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            aboutMeTextLabel.topAnchor.constraint(equalTo: textBackgroundView.topAnchor, constant: 20),
            aboutMeTextLabel.leadingAnchor.constraint(equalTo: textBackgroundView.leadingAnchor, constant: 15),
            aboutMeTextLabel.trailingAnchor.constraint(equalTo: textBackgroundView.trailingAnchor, constant: -15),
            aboutMeTextLabel.bottomAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: -20),
            
            photosLabel.topAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: 52),
            photosLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41),
            
            firstPhotoCollectionImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 14),
            firstPhotoCollectionImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstPhotoCollectionImageView.widthAnchor.constraint(equalToConstant: 190),
            firstPhotoCollectionImageView.heightAnchor.constraint(equalToConstant: 190),
            
            secondPhotoCollectionImageView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 14),
            secondPhotoCollectionImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondPhotoCollectionImageView.widthAnchor.constraint(equalToConstant: 190),
            secondPhotoCollectionImageView.heightAnchor.constraint(equalToConstant: 190),
            
            editButton.widthAnchor.constraint(equalToConstant: 390),
            editButton.heightAnchor.constraint(equalToConstant: 59),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64)
        ])
    }
}
