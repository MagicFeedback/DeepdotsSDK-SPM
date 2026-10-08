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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.6.2/DeepdotsSDK-0.6.2.xcframework.zip",
            checksum: "a3bc2cdeffe149b13e0bfb710f1eb94fee8ee32615f1b963ec4cff784ab5d17c"
        )
    ]
)