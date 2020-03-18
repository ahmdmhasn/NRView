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
  
  public var title: String
  public var cornerRadius: CGFloat
  public var withShadow: Bool
  public var backgroundColor: UIColor?
  public var textColor: UIColor?
  public var borderWidth: CGFloat
  public var borderColor: UIColor?
  
  public init(
    title: String = "",
    cornerRadius: CGFloat = 3,
    withShadow: Bool = false,
    backgroundColor: UIColor? = nil,
    textColor: UIColor? = nil,
    borderWidth: CGFloat = 0,
    borderColor: UIColor? = nil
  ) {
    self.title = title
    self.cornerRadius = cornerRadius
    self.withShadow = withShadow
    self.backgroundColor = backgroundColor
    self.textColor = textColor
    self.borderWidth = borderWidth
    self.borderColor = borderColor
  }
}
