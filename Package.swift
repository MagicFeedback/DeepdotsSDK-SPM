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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.6.1/DeepdotsSDK-0.6.1.xcframework.zip",
            checksum: "14095cb939914a0f520302cfe8d9d87c97d554e5efca90414608fbfe61085d06"
        )
    ]
)