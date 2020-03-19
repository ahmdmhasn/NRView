//
//  NRsettings.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/18/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

public struct NRSettings {
  
  /// Returns default set of settings for NRView
  public static var `default`: NRSettings {
    return NRSettings()
  }
  
  public init() {}
  
  /// Image color which overrides tint mode to template
  public var imageColor: UIColor? = NRDefaultSettings.imageColor
  
  /// image used for NRView
  public var image: UIImage? = UIImage(named: "placeholder_image")
  
  /// Color of title label
  public var titleColor: UIColor? = NRDefaultSettings.textColor
  
  /// Title text
  public var titleText: String? = NRDefaultSettings.text
  
  /// Subtitle text
  public var subtitleText: String? = NRDefaultSettings.text
  
  /// Color of subtitle label
  public var subtitleColor: UIColor? = NRDefaultSettings.textColor
  
  /// Default background color
  public var backgroundColor = NRDefaultSettings.backgroundColor

  /// Defines how the button will be shown, set it to nil to hide the button
  public var buttonSettings: NRButtonSettings? = NRDefaultSettings.buttonSettings
  
  /// Boolean to enable/ disable image shaking on click, default is false
  public var enableImageShaking = NRDefaultSettings.enableImageShaking
  
  /// Image width type, default is regular
  public var imageWidthType = NRDefaultSettings.imageWidthType
  
  
}
