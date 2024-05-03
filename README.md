# 🔗 URL macro

<p>
    <img src="https://img.shields.io/badge/Swift-5.9-orange.svg" />
    <img src="https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

## Usage

Import the library.
```swift
import MacroURL
```

Use the macro to create `URL` instances without force-unwrapping.
```swift
let url = #URL("https://www.google.com")
```

During the compile time, the above variable declaration is rewritten as
```swift
let url = URL(string: "https://www.google.com")!
```
performing a url string validation.

## Installation

You can add the library to an Xcode project by adding it as a package dependency.

> https://github.com/whutao/swift-macro-url

If you want to use the library in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding it to a `dependencies` clause in your `Package.swift`:
``` swift
dependencies: [
    .package(url: "https://github.com/whutao/swift-macro-url", from: "1.0.0")
]
```

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.

## References

- Antonie van der Lee tutorial from his [blog](https://www.avanderlee.com/swift/macros).