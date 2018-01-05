//
//  FellowCell.swift
//  Fellows
//
//  Created by Ashlee Krammer on 1/5/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class FellowCell: UITableViewCell {

    //image view
    lazy var profileImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    //label
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center //centers label
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.backgroundColor = .green
        imageView?.backgroundColor = .orange
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FellowCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        backgroundColor = .white
        setUpViews()
    }
    
    override func layoutSubviews() {
        //we get the frame of the UI elements here
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0 //making round
        profileImageView.layer.masksToBounds = true
    }

    private func setUpViews() {
        setUpProfileImage()
        setUpNameLabel()
    }
    
    private func setUpProfileImage(){
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.80).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor).isActive = true
        profileImageView.backgroundColor = .green
        
    }
    
    private func setUpNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    public func configureCell(fellow: Fellow){
        nameLabel.text =  fellow.name
        if let imageURL = fellow.imageURL {
            if let image = ImageCache.manager.cachedImage(url: imageURL) {
                profileImageView.image = image
            } else {
                ImageCache.manager.processImageInBackground(imageURL: imageURL, completion: { (error, image) in
                    if let error = error {
                        print("Fellow Cell - error processing image: \(error.localizedDescription)")
                    } else if let image = image {
                        DispatchQueue.main.async {
                            self.profileImageView.image = image
                        }
                    }
                })
            }
        } else {
            profileImageView.image = #imageLiteral(resourceName: "IMG_8344")
        }
    }
}
