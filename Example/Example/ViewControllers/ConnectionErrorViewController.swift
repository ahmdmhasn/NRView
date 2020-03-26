//
//  SecondViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class ConnectionErrorViewController: UIViewController {
    
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
    
  // MARK: - Handlers
  @IBAction func addTapped(_ sender: UIBarButtonItem) {
    nrView.show(withAnimationType: .fade(0.5))
  }
  
  
  @IBAction func removeTapped(_ sender: UIBarButtonItem) {
    nrView.hide(withAnimationType: .fade(0.5))
  }
  
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
    var buttonSettings = NRButtonSettings()
    buttonSettings.title = "Try Again"
    buttonSettings.cornerRadius = 3
    buttonSettings.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    buttonSettings.textColor = .blue
    settings.buttonSettings = buttonSettings
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
    
}
