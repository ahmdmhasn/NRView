//
//  NRButton.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/26/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

open class NRButton: UIButton {

  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    commitInit()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    commitInit()
  }
  
  private func commitInit() {
    let edgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    contentEdgeInsets = edgeInsets
  }
  
  // MARK: - Touch Events
  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    scaleAnimation(value: 0.95)
  }
  
  override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    scaleAnimation(value: 0.95)
  }
  
  override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    scaleAnimation(value: 1.0)
  }
  
  override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    scaleAnimation(value: 1.0)
  }

  // MARK: - Configure
  /**
   Apply `buttonSettings` to the view, set it to `nil` to hide the button.
   */
  func configure(_ settings: NRButtonSettings?) {
    
    guard let settings = settings else {
      isHidden = true
      return
    }
    isHidden = false
    /// Apply corner radius to the button, It should not be higher than the half height
    layoutIfNeeded()
    let halfHeight = bounds.size.height / 2
    layer.cornerRadius = min(halfHeight, settings.cornerRadius)
    layer.masksToBounds = settings.cornerRadius != 0
    backgroundColor = settings.backgroundColor
    /// Set title text and color
    setTitle(settings.title)
    setTitle(settings.textColor)
    /// Configure border
    layer.borderWidth = settings.borderWidth
    layer.borderColor = settings.borderColor.cgColor
    /// Configure shadow
    if settings.withShadow { shadow() }
  }
  
}
