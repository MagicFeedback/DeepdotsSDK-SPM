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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.3/DeepdotsSDK-0.1.3.xcframework.zip",
            checksum: "ec4efe0d5b25f5fb5bbe2bfcbce4be0ba12297bc7378cfc8f7addfccdf983cf8"
        )
    ]
)
