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
    
    nrView.settings.buttonSettings = NRButtonSettings(title: "Request Line", cornerRadius: 99, backgroundColor: .red, textColor: .white)
    
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
