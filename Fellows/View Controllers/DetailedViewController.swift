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
    
    private var fellow: Fellow!
    
    init(fellow: Fellow, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        //set fellow
        self.fellow = fellow
        detailedView.configureDetailedView(fellow: fellow, image: image)
        }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(detailedView)
        
        //setup dismiss button
        detailedView.dismissViewButton.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
        detailedView.dismissButton.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
    }

    @objc func dimissView() {
        dismiss(animated: true, completion: nil)
    }
   

}
