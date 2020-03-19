//
//  NoResultView.swift
//  ExampleApp
//
//  Created by Ahmed M. Hassan on 10/27/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

@IBDesignable public class NRView: UIView {
  
  // MARK: - Default Properties
    
  /// NRView settings
  open var settings: NRSettings = .default {
    didSet {
      update()
    }
  }
  
  public enum AnimationType {
    case fade(_ duration: Double)
  }
  
  // MARK: - Touch recognition
  
  /// Closure will be called when user tapes the button. The button argument is passed to the closure.
  open var didTapButton: ((UIButton)->())?
  
  // MARK: - Outlets
  
  @IBOutlet var parentView: UIView!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var button: UIButton!
  @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    
  // MARK: - View Lifecycle
  
  /**
  Initializes and returns a newly allocated NRView object.
  */
  public convenience init(settings: NRSettings = .default) {
    self.init(frame: .zero, settings: settings)
  }

  /**
  Initializes and returns a newly allocated NRView object with the specified frame rectangle.
  - parameter frame: The frame rectangle for the view.
  */
  override public convenience init(frame: CGRect) {
    self.init(frame: frame, settings: .default)
  }

  public init(frame: CGRect, settings: NRSettings) {
    super.init(frame: frame)
    commitInit()
    self.settings = settings
  }
  
  /// Initializes and returns a newly allocated NRView object.
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commitInit()
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    configureParentFrame()
  }
  
  private func commitInit() {
    // Add StackView and set constraints
    Bundle(for: NRView.self)
      .loadNibNamed("\(NRView.self)", owner: self, options: nil)
    addSubview(parentView)
    configureParentFrame()
  }
  
  private func configureParentFrame() {
    parentView.frame = frame
    parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    update()
  }
  
  // MARK: - Class Initialization
  /**
   Create an instance of NRView
   - parameter view: parent view in which the NRView will be added to.
   - parameter initiallyHidden: If you want NRView to be added but not visible after initialization, default value is false
   */
  public static func addToView(_ view: UIView, settings: NRSettings = .default, initiallyHidden: Bool = true) -> NRView {
    // Check if the view already have an instance of NRView
    for v in view.subviews {
      if v is NRView {
        return v as! NRView
      }
    }
    // Create instance and set visibility
    let nrView = NRView(settings: settings)
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
   Updates the view for the selected settings.
   */
  open func update() {
    
    titleLabel.text = settings.titleText
    titleLabel.textColor = settings.titleColor
    
    subtitleLabel.text = settings.subtitleText
    subtitleLabel.textColor = settings.subtitleColor
        
    backgroundColor = settings.backgroundColor

    updateButtonSettings()
    
    setImage(settings.image, withTintColor: settings.imageColor)
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
    /// Update image width
    imageWidthConstraint.constant = settings.imageWidthType.value
  }
      
  // MARK: - Interface Builder

  /// Image color
  @IBInspectable public var imageColor : UIColor? = NRDefaultSettings.imageColor {
    didSet { settings.imageColor = imageColor }
  }
  
  /// NRView image
  @IBInspectable public var image: UIImage? = NRDefaultSettings.image {
    didSet { settings.image = image }
  }
  
  /// Title text
  @IBInspectable public var titleText: String? = NRDefaultSettings.text {
    didSet { settings.titleText = titleText }
  }
  
  /// Subtitle text
  @IBInspectable public var subtitleText: String? = NRDefaultSettings.text {
    didSet { settings.subtitleText = subtitleText }
  }
  
  /// Button title
  @IBInspectable public var buttonTitle: String = NRDefaultSettings.buttonSettings.title {
    didSet { settings.buttonSettings?.title = buttonTitle }
  }

  /// Text color
  @IBInspectable public var titleColor : UIColor? = NRDefaultSettings.textColor {
    didSet { settings.titleColor = titleColor }
  }
  
  @IBInspectable public var subtitleColor : UIColor? = NRDefaultSettings.textColor {
    didSet { settings.subtitleColor = subtitleColor }
  }
    
  /// Background color of NRView, default is clear
  @IBInspectable public var bgColor: UIColor = NRDefaultSettings.backgroundColor {
    didSet { settings.backgroundColor = bgColor }
  }

  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    update()
  }
  
}

// MARK: - IB Actions

private extension NRView {
  
  @IBAction func didTapButton(_ sender: UIButton) {
    self.didTapButton?(sender)
  }
      
}

// MARK: - UI Helpers

private extension NRView {
  
  /**
   Apply `buttonSettings` to the view
   */
  func updateButtonSettings() {
    
    guard let buttonSettings = settings.buttonSettings else {
      button.isHidden = true
      return
    }
    
    let edgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.contentEdgeInsets = edgeInsets

    /// Apply corner radius to the button, It should not be higher than the half height
    layoutIfNeeded()
    let halfHeight = button.bounds.size.height / 2
    button.layer.cornerRadius = min(halfHeight, buttonSettings.cornerRadius)
    button.layer.masksToBounds = buttonSettings.cornerRadius != 0
    button.backgroundColor = buttonSettings.backgroundColor
    
    button.setTitle(buttonSettings.title)
    button.tintColor = buttonSettings.textColor
    
    button.layer.borderWidth = buttonSettings.borderWidth
    
    button.layer.borderColor = buttonSettings.borderColor.cgColor
    
    if buttonSettings.withShadow { button.shadow() }
  }

}
