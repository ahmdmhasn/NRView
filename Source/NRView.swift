//
//  NoResultView.swift
//  ExampleApp
//
//  Created by Ahmed M. Hassan on 10/27/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

public protocol NRViewDelegate: class {
  func nrView(_ view: NRView, didPressButton sender: UIButton)
}

public class NRView: UIView {
  
  // MARK: - Default Properties
  
  public struct NRProperties {
    public var imageColor: UIColor? = nil
    public var textColor: UIColor? = nil
    public var buttonStyle: NRButtonStyle = ButtonStyle.default
    public var image: UIImage? = UIImage(named: "placeholder_image")
  }
  
  public static var Properties = NRProperties()
  
  public enum AnimationType {
    case fade(_ duration: Double)
  }
  
  // MARK: - Outlets
  
  @IBOutlet var parentView: UIView!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var button: UIButton!
  @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
  
  // MARK: - Properties
  
  public weak var delegate: NRViewDelegate?
  
  /**
   Set image color
   */
  @IBInspectable public var imageColor : UIColor? = NRView.Properties.imageColor {
    didSet { setImage(imageView.image, withTintColor: imageColor) }
  }
  
  /**
   Set text color
   */
  @IBInspectable public var textColor : UIColor? = NRView.Properties.textColor {
    didSet { [titleLabel, descriptionLabel].forEach{ $0.textColor = textColor } }
  }
  
  /**
   Set different styles for the button, set it to nil to hide the button
   */
  public var buttonStyle: NRButtonStyle? = NRView.Properties.buttonStyle {
    didSet { updateButtonStyle() }
  }
  
  /**
   Add shaking animation when image is tapped
   */
  public var shakeImageOnClick: Bool = false {
    didSet { shouldShakeImage(shakeImageOnClick) }
  }
  
  // MARK: - View Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commitInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commitInit()
  }
  
  private func commitInit() {
    // Add StackView and set constraints
    Bundle(for: NRView.self)
      .loadNibNamed("\(NRView.self)", owner: self, options: nil)
    addSubview(parentView)
    parentView.frame = frame
    parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    [titleLabel, descriptionLabel].forEach{ $0.textColor = textColor }
  }
  
  // MARK: - Class Initialization
  /**
   Create an instance of NRView
   - parameter view: parent view in which the NRView will be added to.
   - parameter initiallyHidden: If you want NRView to be added but not visible after initialization, default value is false
   */
  public static func addToView(_ view: UIView, initiallyHidden: Bool = false) -> NRView {
    // Check if the view already have an instance of NRView
    for v in view.subviews {
      if v is NRView {
        return v as! NRView
      }
    }
    // Create instance and set visibility
    let nrView = NRView(frame: CGRect.zero)
    nrView.alpha = initiallyHidden ? 0 : 1
    // Add to subview
    view.addSubview(nrView)
    // Set constraints
    nrView.translatesAutoresizingMaskIntoConstraints = false
    nrView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    nrView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    nrView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    nrView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    
    return nrView
  }
  
  /**
   Remove NRView if already added to the view
   - parameter view: parent view to remove NRView from
   - parameter animated: should animate
   */
  static func removeFromView(_ view: UIView, animated: Bool = true) {
    for v in view.subviews {
      if v is NRView {
        if animated {
          UIView.animate(withDuration: 0.3, animations: {
            v.alpha = 0
          }) { (completed) in
            v.removeFromSuperview()
          }
          
        } else {
          v.removeFromSuperview()
        }
        
      }
    }
  }
  
  // MARK: - Instance Initialization

  /**
   Show NRView with a duration
   - parameter withAnimationType: custom animation type with duration of the animation
   */
  public func show(withAnimationType type: AnimationType? = .fade(0.3)) {
    switch type {
      
    case .fade(let duration):
      fadeAnimation(duration: duration, alpha: 1)
      
    case .none:
      self.alpha = 1
    }
  }
  
  /**
   Hide NRView with a duration
   - parameter withAnimationType: custom animation type with duration of the animation
   */
  public func hide(withAnimationType type: AnimationType? = .fade(0.3)) {
    switch type {
      
    case .fade(let duration):
      fadeAnimation(duration: duration, alpha: 0.0)
      
    case .none:
      self.alpha = 1
    }
  }

  // MARK: - Configure View
  
  /**
   Set text fot NRView
   - parameter title: title text. set it nil to hide the title
   - parameter description: description text. set it nil to hide the description
   */
  public func setText(title: String?, description: String?) {
    self.titleLabel.text = title
    self.descriptionLabel.text = description
    // Hide title | description if empty or nil
    self.titleLabel.isHidden = (title?.isEmpty ?? true)
    self.descriptionLabel.isHidden = (description?.isEmpty ?? true)
  }
  
  /**
   Set image for NRView with tint color
   - parameter image: image that will be displayed, can be nil
   - parameter color: tint color, leave it or set the value with nil ta add the original image
   */
  public func setImage(_ image: UIImage?, withTintColor color: UIColor? = nil) {
    if let color = color {
      self.imageView.image = image?.withRenderingMode(.alwaysTemplate)
      self.imageView.tintColor = color
    } else {
      self.imageView.image = image
    }
  }
  
  /**
   Set the image width value, cannot be larger than 60% of the view total width
   - parameter value: new value, default is 220
   */
  public func setImageWidth(_ type: ImageWidthType) {
    imageWidthConstraint.constant = type.value
  }
    
}

// MARK: - IB Actions

private extension NRView {
  
  @IBAction func didTapButton(_ sender: UIButton) {
    delegate?.nrView(self, didPressButton: sender)
  }
  
  @objc func imageViewTapped(_ sender: UIGestureRecognizer) {
    imageView.shake()
  }
  
}

// MARK: - UI Helpers

private extension NRView {
  
  /**
   Apply `buttonStyle` to the view
   */
  func updateButtonStyle() {
    
    guard let style = buttonStyle else {
      button.isHidden = true
      return
    }
    
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.titleLabel?.lineBreakMode = .byWordWrapping
    
    layoutIfNeeded()
    let halfHeight = button.bounds.size.height / 2
    button.layer.cornerRadius = min(halfHeight, style.cornerRadius)
    button.layer.masksToBounds = style.cornerRadius != 0
    if let backgroundColor = style.backgroundColor { button.backgroundColor = backgroundColor }
    
    button.setTitle(style.title, for: .normal)
    if let textColor = style.textColor { button.setTitleColor(textColor, for: .normal) }
    
    button.layer.borderWidth = style.borderWidth
    
    if let borderColor = style.borderColor { button.layer.borderColor = borderColor.cgColor }
    
    if style.withShadow { button.shadow() }
  }

  func shouldShakeImage(_ shakeImage: Bool) {
    // Image Shaking
    imageView.isUserInteractionEnabled = shakeImage
    if shakeImageOnClick {
      imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
    } else {
      imageView.gestureRecognizers?.forEach{imageView.removeGestureRecognizer($0)}
    }
  }

}
