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
  
  public static var `default` = NRButtonSettings()
  
  public init() {}

  public var title: String = "Button"
  
  public var cornerRadius: CGFloat = 0
  
  public var withShadow: Bool = false
  
  public var backgroundColor: UIColor = .clear
  
  public var textColor: UIColor = UIApplication.shared.keyWindow?.tintColor ?? .black
  
  public var borderWidth: CGFloat = 0
  
  public var borderColor: UIColor = .clear
  
}
