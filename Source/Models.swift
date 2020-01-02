//
//  Models.swift
//  NRView
//
//  Created by Victory Mac Mini on 1/2/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol NRButtonStyle {
    var title: String { get }
    var cornerRadius: CGFloat { get }
    var withShadow: Bool { get }
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }
}

// MARK: - Structs
struct NRButtonStyleNone: NRButtonStyle {
    static var `default` = NRButtonStyleNone(title: "Tap Me!", backgroundColor: .white, textColor: .blue)
    let title: String
    let cornerRadius: CGFloat = 0
    let withShadow: Bool = false
    let backgroundColor: UIColor
    let textColor: UIColor
    let borderWidth: CGFloat = 0
    let borderColor: UIColor = .clear
}

struct NRButtonStyleRounded: NRButtonStyle {
    let title: String
    let cornerRadius: CGFloat
    let withShadow: Bool
    let backgroundColor: UIColor
    let textColor: UIColor
    let borderWidth: CGFloat = 0
    let borderColor: UIColor = .clear
}

struct NRButtonStyleBorder: NRButtonStyle {
    let title: String
    let cornerRadius: CGFloat
    let withShadow: Bool
    let backgroundColor: UIColor
    let textColor: UIColor
    let borderWidth: CGFloat
    let borderColor: UIColor
}
