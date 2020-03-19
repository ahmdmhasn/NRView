//
//  NRTableViewCell.swift
//  Example
//
//  Created by Ahmed M. Hassan on 3/19/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class NRTableViewCell: UITableViewCell {
  
  // MARK: - Views
  var nrView: NRView!
  
  // MARK: - View Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    if nrView == nil {
      configureNRView()
    }
    contentView.heightAnchor.constraint(equalToConstant: 300).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureNRView() {
    let color = UIColor(red: 40/255, green: 103/255, blue: 178/255, alpha: 1)
    
    var settings = NRSettings()
    settings.subtitleText = "Be the first to comment."
    settings.image = UIImage(named: "linkedin_comment")
    settings.imageWidthType = .compact
    
    var buttonSettings = NRButtonSettings()
    buttonSettings.title = "Comment"
    buttonSettings.textColor = color
    buttonSettings.borderColor = color
    buttonSettings.borderWidth = 2
    buttonSettings.cornerRadius = 4
    
    settings.buttonSettings = buttonSettings
    
    nrView = NRView.addToView(self.contentView, settings: settings)
    nrView.show()
  }
  
}
