//
//  FellowView.swift
//  Fellows
//
//  Created by Ashlee Krammer on 1/5/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class FellowView: UIView {

    //SETTING UP TV
    lazy var tableView: UITableView = {
        let tv = UITableView()
        //SETTING UP CELL
        tv.register(FellowCell.self, forCellReuseIdentifier: "FellowCell")
        tv.backgroundColor = .orange
        return tv
    }()
    
    //SET UP CUSTOM VIEW
    //Saved to snippets
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds) //SETS TO THE BOUNDS OF THE SCREEN
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setUpViews()
    }
    private func setUpViews() {
    setupTableView()
    }
    
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false //This line makes sure you are in controll of your restraints, not xcode
        //Below wets the contraints to the safe area and makes them active
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

        
    }
    
}
