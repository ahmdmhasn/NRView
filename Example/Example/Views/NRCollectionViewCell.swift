//
//  NRCollectionViewCell.swift
//  Example
//
//  Created by Ahmed M. Hassan on 3/19/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit
import NRView

class NRCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Views
  var nrView: NRView!
  
  // MARK: - View Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    if nrView == nil {
      configureNRView()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureNRView() {
    
    var settings = NRSettings()
    settings.titleText = "View More"
    settings.buttonSettings = nil
    
    nrView = NRView.addToView(self.contentView, settings: settings)
    nrView.show()
  }
  
}
