//
//  SecondViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Handlers
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        let nrView = NRView.addToView(view)
        // Show with animation
        nrView?.show(withAnimationType: .fade(0.5))
    }
    
    
    @IBAction func removeTapped(_ sender: UIBarButtonItem) {
        NRView.removeFromView(view)
    }
    

}
