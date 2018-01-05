//
//  FellowsViewController.swift
//  Fellows
//
//  Created by Ashlee Krammer on 1/5/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit

class FellowsViewController: UIViewController {
    
    let fellowView = FellowView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(fellowView)
        
        //Set up delegate and data source
        fellowView.tableView.dataSource = self
        fellowView.tableView.delegate = self
        
        navigationItem.title = "Fellows"
    }
    
    
}

//Table View Data Source Extension
extension FellowsViewController: UITableViewDataSource {
    
    //Number of Rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FellowCell", for: indexPath)
        cell.textLabel?.text = "It Worked!!"
        return cell
    }
    
    
}

//Table View Delegate Extension
extension FellowsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //Setting cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}
