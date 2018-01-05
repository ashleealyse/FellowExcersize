//
//  DetailedViewController.swift
//  Fellows
//
//  Created by Ashlee Krammer on 1/5/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import UIKit



class DetailedViewController: UIViewController {

    let detailedView = DetailedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(detailedView)
        
        //setup dismiss button
        detailedView.dismissViewButton.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
    }

    @objc func dimissView() {
        dismiss(animated: true, completion: nil)
    }
   

}
