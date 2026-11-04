// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "DeepdotsSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "ComposeApp", targets: ["ComposeApp"]) // módulo consumido desde Swift
    ],
    targets: [
        .binaryTarget(
            name: "ComposeApp",
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.9/DeepdotsSDK-0.7.9.xcframework.zip",
            checksum: "e7f6aeea192b566d4518fdc6395d0d11148dd2f8b4a11f732c2c5ae60fab43ab"
        )
    ]
)