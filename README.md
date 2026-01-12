# DeepdotsSDK-SPM

Swift Package Manager distribution for DeepdotsSDK.

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM.git", from: "1.0.0")
]
```

Or in Xcode:
1. File > Add Package Dependencies
2. Enter the repository URL: `https://github.com/MagicFeedback/DeepdotsSDK-SPM`
3. Select the version you want to use

## Usage

Import the SDK in your Swift files:

```swift
import DeepdotsSDK
```

## Release Structure

This repository uses binary targets for distribution. Each release includes:
- A git tag with the version number (e.g., `1.0.0`)
- A release asset named `DeepdotsSDK-<version>.xcframework.zip` containing the pre-built XCFramework

## Requirements

- iOS 12.0+
- Swift 5.3+