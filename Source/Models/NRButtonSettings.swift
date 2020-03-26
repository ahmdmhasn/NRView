//
//  NRButtonStyle.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/17/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

// MARK: - NRButtonStyle

// MARK: Structs
public struct NRButtonSettings {
  
  /// Returns default set of settings for NRButtonSettings.
  public static var `default` = NRButtonSettings()
  
  public init() {}

  /// Button title
  public var title: String = "Button"
  
  /// Button corner radius, default is `0`.
  public var cornerRadius: CGFloat = 0
  
  /// Set to true to show shadow around the button, default is `false`.
  public var withShadow: Bool = false
  
  /// Button background color.
  public var backgroundColor: UIColor = .clear
  
  /// Title text color, default is app `tintColor`.
  public var textColor: UIColor = UIApplication.shared.keyWindow?.tintColor ?? .black
  
  /// Border width, default is `0`.
  public var borderWidth: CGFloat = 0
  
  /// Border color, default is clear. You will have to set border width value to make it visible.
  public var borderColor: UIColor = .clear
  
}
