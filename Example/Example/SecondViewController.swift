//
//  SecondViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class SecondViewController: UIViewController {
    
    private lazy var nrView: NRView = {
        let nrView = NRView.addToView(view, initiallyHidden: true)
        // Shake image on tap
        nrView.shakeImageOnClick = true
        // Set text
        nrView.setText(
            title: "Unable to Connect",
            description: "Please check your internet connextion and try again"
        )
        // Set Image
        
        // Delegate
        
        // Update colors
//        nrView.backgroundColor = .darkGray
//        nrView.textColor = .lightGray
//        nrView.imageColor = .lightGray

        // Set Button
        nrView.buttonStyle = ButtonStyle(
            title: "Tap Me!",
            cornerRadius: 3,
            backgroundColor: UIColor.blue.withAlphaComponent(0.1),
            textColor: UIColor.darkGray,
            borderWidth: 2,
            borderColor: UIColor.darkGray
        )
        
        return nrView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Handlers
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
        nrView.show(withAnimationType: .fade(0.5))
    }
    
    
    @IBAction func removeTapped(_ sender: UIBarButtonItem) {
        nrView.hide(withAnimationType: .fade(0.5))
    }
    

}
