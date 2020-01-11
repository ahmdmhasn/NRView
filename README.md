# NRView

No Result View makes your app looks perfect when no results exists instead of showing empty view.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## Features

* Ability to show image, text, button or all of them.
* Add pre-customized attributes for the element.
* Handle button action if needed.

## Requirements

iOS 10.0+
Xcode 10.2+
Swift 5+

## Communication

* If you found a bug, open an issue here on GitHub and follow the guide. The more detail the better!
* If you want to contribute, submit a pull request.

## Installing

#### CocoaPods

CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate NRView into your Xcode project using CocoaPods, specify it in your Podfile:
```
pod 'NRView', '~> 0.1.1'
```

#### Manually

If you prefer not to use any of the aforementioned dependency managers, you can copy ``` Source ``` into your project manually.

## How It Works

#### Using Storyboard/ xib

```
@IBOutlet weak var nrView: NRView!

// Initial view setup
nrView.setup(text: "Nothing here for you!",
        image: UIImage(named: "desert"),
        delegate: self)
```

Set colors
```
nrView.textColor = .gray
nrView.imageColor = .gray
```

Add shakable animation when image tapped
```
nrView.shakeImageOnClick = true
```

Change button style
```
// Default
nrView.buttonStyle(.none(color: .gray))
        
// Rounded
nrView.buttonStyle(.rounded(cornerRadius: 99, withShadow: true, backgroundColor: .darkGray, textColor: .orange))
        
// With Stroke
nrView.buttonStyle(.stroke(cornerRadius: 5, withShadow: true, color: .blue, strokeWidth: 2))
```

Show NRView with fading animation (with optional duration)
```
nrView.fadeIn(duration: 2.5)
```

Hide NRView with fading animation
```
nrView.fadeOut()
```

Handle button response (You should set delegate property)
```
extension ViewController: NoResultViewDelegate {
    func noResultView(_ view: NoResultView, didPressButton sender: UIButton) {
        print("Button was pressed")
    }   
}
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
