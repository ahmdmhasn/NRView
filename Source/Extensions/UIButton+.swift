//
//  UIButton+.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/19/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit.UIButton

extension UIButton {
  
  private var allStates: [UIControl.State] {
    [.normal, .disabled, .application, .focused, .highlighted, .reserved, .selected]
  }
  
  func setTitle(_ title: String?) {
    allStates.forEach{
      self.setTitle(title, for: $0)
    }
  }
  
}
