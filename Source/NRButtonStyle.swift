//
//  NRButtonStyle.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/17/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

// MARK: - NRButtonStyle

// MARK: Protocols
public protocol NRButtonStyle {
  var title: String { get }
  var cornerRadius: CGFloat { get }
  var withShadow: Bool { get }
  var backgroundColor: UIColor? { get }
  var textColor: UIColor? { get }
  var borderColor: UIColor? { get }
  var borderWidth: CGFloat { get }
}

// MARK: Structs
public struct ButtonStyle: NRButtonStyle {
  public static var `default` = ButtonStyle(title: "Button", cornerRadius: 3)
  public let title: String
  public let cornerRadius: CGFloat
  public let withShadow: Bool
  public let backgroundColor: UIColor?
  public let textColor: UIColor?
  public let borderWidth: CGFloat
  public let borderColor: UIColor?
  
  public init(
    title: String = "",
    cornerRadius: CGFloat = 0,
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
