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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.6/DeepdotsSDK-0.7.6.xcframework.zip",
            checksum: "604c660d0e837240397d4d9e48bcc96d6d8ceed2a5b0f3aeb545a7c99d0c828b"
        )
    ]
)