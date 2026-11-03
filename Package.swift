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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.7/DeepdotsSDK-0.7.7.xcframework.zip",
            checksum: "5edcadb8a6d3f24ffc914ca579a65cf6dc644dc853adfd6e1a97632c4e6c2332"
        )
    ]
)