//
//  MainViewController.swift
//  HW2.3
//
//  Created by Alexey Manokhin on 16.11.2023.
//

import UIKit

final class MainViewController: UIViewController {

    lazy var hStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.addArrangedSubview(getPhotoView(photoNamed: "firstImage"))
        stack.addArrangedSubview(getPhotoView(photoNamed: "secondImage"))
      //  stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var vStack = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .top
        stack.addArrangedSubview(photosLabel)
        stack.addArrangedSubview(hStack)
        return stack
    }()
    
    lazy var contentView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.contentInset = .zero
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        return scrollView
    }()
    
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
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var aboutMeLabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-bold", size: 12)
        label.text = "О себе"
        label.adjustsFontSizeToFitWidth = true
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(scrollView)
        setupViews()
    }
    
    private func setupViews() {
        [photoImageView,
         fullNameLabel,
         aboutMeLabel,
         textBackgroundView,
         editButton,
         vStack
        ].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 79),
            photoImageView.widthAnchor.constraint(equalToConstant: 80),
            photoImageView.heightAnchor.constraint(equalToConstant: 80),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 19),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 119),
            fullNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            aboutMeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aboutMeLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 39),
            
            textBackgroundView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 7),
            textBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            aboutMeTextLabel.topAnchor.constraint(equalTo: textBackgroundView.topAnchor, constant: 20),
            aboutMeTextLabel.leadingAnchor.constraint(equalTo: textBackgroundView.leadingAnchor, constant: 15),
            aboutMeTextLabel.trailingAnchor.constraint(equalTo: textBackgroundView.trailingAnchor, constant: -15),
            aboutMeTextLabel.bottomAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: -20),
            
            vStack.topAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: 52),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        
            editButton.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 20),
            editButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 59),
            editButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -64)
        ])
    }
    
    private func getPhotoView(photoNamed: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(named: photoNamed))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }
    
}
