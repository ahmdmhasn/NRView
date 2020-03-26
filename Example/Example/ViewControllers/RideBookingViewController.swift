//
//  ViewController.swift
//  Example
//
//  Created by Ahmed M. Hassan on 12/2/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class RideBookingViewController: UIViewController {
  
  @IBOutlet weak var nrView: NRView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var buttonSettings = NRButtonSettings()
    buttonSettings.title = "Request Line"
    buttonSettings.cornerRadius = 99
    buttonSettings.backgroundColor = .red
    buttonSettings.textColor = .white
    nrView.settings.buttonSettings = buttonSettings
    
    nrView.settings.imageWidthType = .any(50)
    
  }
  
  // MARK: - Handlers
  
  @IBAction func showTapped(_ sender: UIBarButtonItem) {
    nrView.show()
  }
  
  @IBAction func hideTapped(_ sender: UIBarButtonItem) {
    nrView.hide()
  }
  
}
