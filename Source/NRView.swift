//
//  NoResultView.swift
//  ExampleApp
//
//  Created by Ahmed M. Hassan on 10/27/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import UIKit

protocol NRViewDelegate: class {
    func nrView(_ view: NRView, didPressButton sender: UIButton)
}

class NRView: UIView {
    
    // MARK: - Default Properties
    static var color: UIColor = UIColor.gray
    static var buttonStyle: ButtonStyle = .none(color: NRView.color)
    
    enum ButtonStyle {
        case none(color: UIColor)
        case rounded(cornerRadius: CGFloat, withShadow: Bool, backgroundColor: UIColor, textColor: UIColor)
        case stroke(cornerRadius: CGFloat, withShadow: Bool, color: UIColor, strokeWidth: CGFloat)
    }
    
    enum AnimationType {
        case fade(_ duration: Double)
    }
    
    // Mark: - Outlets
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Properties
    
    public weak var delegate: NRViewDelegate?
    
    /**
     Set image color
     */
    @IBInspectable public var imageColor : UIColor = NRView.color {
        didSet{
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = imageColor
        }
    }

    /**
     Set text color
     */
    @IBInspectable public var textColor : UIColor = NRView.color {
        didSet{
            self.textLabel.textColor = textColor
        }
    }
    
    /**
     Add shaking animation when image is tapped
     */
    public var shakeImageOnClick: Bool = false {
        didSet {
            imageView.isUserInteractionEnabled = shakeImageOnClick
            if shakeImageOnClick {
                imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))
            } else {
                imageView.gestureRecognizers?.forEach{imageView.removeGestureRecognizer($0)}
            }
        }
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commitInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commitInit()
    }
    
    private func commitInit() {
        Bundle.main.loadNibNamed(String(describing: NRView.self), owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Set default values
        self.buttonStyle(NRView.buttonStyle)
    }
    
    // MARK: - Public Handlers
    
    /**
     This method provides initial setup for the view
     - parameter text: text to be added to the view
     - parameter image: image that will be displayed, can be nil
     - parameter delegate: set a delegate to receive view actions
     */
    public func setup(text: String? = nil, image: UIImage? = nil, delegate: NRViewDelegate? = nil) {
        if let text = text { self.textLabel.text = text }
        if let image = image { self.imageView.image = image }
        if let delegate = delegate { self.delegate = delegate }
    }
    
    /**
     Set different styles for the button
     - parameter style: choose your prefered style
     */
    public func buttonStyle(_ style: ButtonStyle) {
        
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        
        switch style {
        case .none(let color):
            button.setTitleColor(color, for: .normal)
            
        case .rounded(let cornerRadius, let withShadow, let backgroundColor, let textColor):
            let halfHeight = button.bounds.height / 2
            button.layer.cornerRadius = (cornerRadius > halfHeight) ? halfHeight : cornerRadius
            button.backgroundColor = backgroundColor
            button.setTitleColor(textColor, for: .normal)
            if withShadow { button.shadow() }
            
        case .stroke(let cornerRadius, let withShadow, let color, let strokeWidth):
            let halfHeight = button.bounds.height / 2
            button.layer.cornerRadius = (cornerRadius > halfHeight) ? halfHeight : cornerRadius
            button.backgroundColor = .none
            button.setTitleColor(color, for: .normal)
            button.layer.borderWidth = strokeWidth
            button.layer.borderColor = color.cgColor
            if withShadow { button.shadow() }
        }
    }
    
    /**
     Show NRView with a duration
     - parameter withAnimationType: custom animation type with duration of the animation
     */
    public func show(withAnimationType type: AnimationType = .fade(0.3)) {
        switch type {
        case .fade(let duration):
            UIView.animate(withDuration: duration) {
                self.alpha = 1
            }
        }
    }
    
    /**
     Hide NRView with a duration
     - parameter withAnimationType: custom animation type with duration of the animation
     */
    public func hide(withAnimationType type: AnimationType = .fade(0.3)) {
        switch type {
        case .fade(let duration):
            UIView.animate(withDuration: duration) {
                self.alpha = 0.0
            }
        }
    }
    
    // MARK: - Private Handlers
    
    @IBAction private func buttonPressed(_ sender: Any) {
        delegate?.nrView(self, didPressButton: sender as! UIButton)
    }
    
    @objc private func imageViewTapped(_ sender: UIGestureRecognizer) {
        imageView.shake()
    }
    
}
