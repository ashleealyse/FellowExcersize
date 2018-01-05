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
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FellowCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        backgroundColor = .white
        setUpViews()
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
        
    }
    
    private func setUpNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false 
    }
}
