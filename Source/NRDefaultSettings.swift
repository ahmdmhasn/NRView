//
//  NRDefaultSettings.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/18/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

/**
 Default settings values
 */
struct NRDefaultSettings {
  
  init() {}
  
  static let defaultColor = UIColor.gray
  
  /// Image color
  static let imageColor: UIColor? = nil
  
  /// image used for NRView
  static let image = UIImage(named: "placeholder_image")
  
  /// Color of the text.
  static let textColor = defaultColor
  
  /// Default text.
  static let text: String? = nil
  
  /// default button style
  static let buttonStyle = NRButtonSettings.default

  /// Boolean to enable/ disable image shaking on click
  static let enableImageShaking = false
  
  /// Desired image width type
  static let imageWidthType = ImageWidthType.regular
  
  
}
