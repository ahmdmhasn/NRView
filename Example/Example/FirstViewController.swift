//
//  ViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class FirstViewController: UIViewController {

    @IBOutlet weak var nrView: NRView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Initial view setup
        nrView.delegate = self
        nrView.setText(
            title: "Internet Error",
            description: "Please check your internet connection then try again."
        )
//        nrView.setImage(nil, withTintColor: nil)

        // Set colors
//        nrView.textColor = .gray
//        nrView.imageColor = .gray
        
        // Add shakable animation when image tapped
        nrView.shakeImageOnClick = true
        
        
        // Change button style
        // Default

        // Rounded
        nrView.buttonStyle = ButtonStyle(
            title: "Try again",
            cornerRadius: 5,
            backgroundColor: UIColor.blue.withAlphaComponent(0.1)
        )
        
        // With Stroke

      
        nrView.setImageWidth(.any(35))
        
    }

    // MARK: - Handlers

    @IBAction func showTapped(_ sender: UIButton) {
        nrView.show()
    }
    
    @IBAction func hideTapped(_ sender: UIButton) {
        nrView.hide()
    }
    
}

extension FirstViewController: NRViewDelegate {
    
    func nrView(_ view: NRView, didPressButton sender: UIButton) {
        print("Button was pressed")
    }

}
