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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.0/DeepdotsSDK-0.7.0.xcframework.zip",
            checksum: "4f7034fa16e5bfabd8d5d8ea1e8eebd87d97c848b89dfd52ae5c6bd814401f88"
        )
    ]
)