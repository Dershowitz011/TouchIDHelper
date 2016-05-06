# TouchIDHelper
A TouchID Helper with completion handler just so that you can present it whenever you need.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

#Usage
- Import it wherever you need

```swift
import TouchIDHelper
```

- Check for TouchID availability like

```swift
switch TouchIDHelper.isTouchIDAllowed {
case .Pass:
  // All is good. Can use Touch ID for authentication
  break
case .Fail(let error):
  // TouchID cannot be used. Interrogate error to see why
  break
}
```
- Present TouchID authentication whenever && wherever you want like so:

```swift
TouchIDHelper.showTouchID("Testing Touch ID", fallbackTitle: "Fallback Method") { response in
  switch response {
  case .Pass:
    // Successful authentication
    break
  case .Fail(let error):
    // Authentication failed. Interrogate error to see why
    break
  }
}
```        
        
#Installation

- Clone and run

### Setting up with Carthage
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate TouchIDHelper into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Dershowitz011/TouchIDHelper"
```


