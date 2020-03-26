//
//  NRView+enum.swift
//  NRView
//
//  Created by Ahmed M. Hassan on 3/17/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

// MARK: - ImageWidthType

/// A width for the NR ImageView
public enum ImageWidthType {
  
  /// Regualar case with default value of `220`
  case regular
  
  /// Compact case with a default value of `150`
  case compact
  
  /// Any other values
  case any(CGFloat)
  
  /// - Returns: a `CGFloat` value for the enum type.
  var value: CGFloat {
    switch self {
    case .regular: return 220
    case .compact: return 150
    case .any(let value): return value
    }
  }
  
}
