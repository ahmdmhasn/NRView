//
//  SecondViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class ClassInitViewController: UIViewController {
  
  // MARK: - NRView
  private lazy var settings: NRSettings = {
    var settings = NRSettings()
    // Set text
    settings.titleText = "Unable to Connect"
    settings.subtitleText = "Please check your internet connection and try again."
    // Set Image
    settings.image = UIImage(named: "group")
    settings.imageColor = .gray
    settings.imageWidthType = .compact
    // Set Button
    settings.buttonSettings = NRButtonSettings(
      title: "Try Again",
      cornerRadius: 3,
      backgroundColor: UIColor.blue.withAlphaComponent(0.1),
      textColor: .blue
    )
    return settings
  }()
  
  private lazy var nrView: NRView = {
    let nrView = NRView.addToView(view, settings: settings)
    // Delegate
    nrView.didTapButton = { button in
      print("Try Again Button Tapped...")
    }
    return nrView
  }()
  
  // MARK: - View Lifecycle
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
