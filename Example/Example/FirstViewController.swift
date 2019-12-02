//
//  ViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
//import NRView

class FirstViewController: UIViewController {

    @IBOutlet weak var nrView: NRView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial view setup
        nrView.setup(text: "Something went wrong!",
                           delegate: self)
        
        // Set colors
//        nrView.textColor = .gray
//        nrView.imageColor = .gray
        
        // Add shakable animation when image tapped
        nrView.shakeImageOnClick = true
        
        
        // Change button style
        // Default
        nrView.buttonStyle(.none(color: .gray))

        // Rounded
//         nrView.buttonStyle(.rounded(cornerRadius: 99, withShadow: true, backgroundColor: .darkGray, textColor: .lightGray))
        
        // With Stroke
        // nrView.buttonStyle(.stroke(cornerRadius: 5, withShadow: true, color: .blue, strokeWidth: 2))

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
