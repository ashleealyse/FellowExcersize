//
//  DetailedView.swift
//  Fellows
//
//  Created by Ashlee Krammer on 1/5/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class DetailedView: UIView {
    
    lazy var dismissViewButton: UIButton = {
        let button = UIButton(frame: UIScreen.main.bounds)
        button.backgroundColor = .clear
        
        return button
    }()
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "dismissButtonIcon"), for: .normal)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .clear
        setUpViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2.0
        profileImage.layer.masksToBounds = true
            
    }
    
    private func setUpViews() {
        setupBlurEffectView()
        setUpDismissView()
        setUpContainerView()
        setupDismissButton()
        setUpNameLabel()
        setUpProfileImage()
    }
    
    private func setupBlurEffectView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark) // .light, .dark, .prominent, .regular, .extraLight
        let visualEffect = UIVisualEffectView(frame: UIScreen.main.bounds) 
        visualEffect.effect = blurEffect
        addSubview(visualEffect)
    }
    
    private func setUpDismissView() {
        addSubview(dismissViewButton)
    }
    
    private func setUpContainerView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.90).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.80).isActive = true

    }
    
    private func setupDismissButton() {
        addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setUpNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: dismissButton.bottomAnchor).isActive = true
    }
    
    public func configureDetailedView(fellow: Fellow, image: UIImage){
        nameLabel.text = fellow.name
        profileImage.image = image
    }
    
    private func setUpProfileImage() {
        addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        profileImage.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.50 )
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor).isActive = true
    }
    
    
}
