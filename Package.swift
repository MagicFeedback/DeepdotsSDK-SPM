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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.4/DeepdotsSDK-0.1.4.xcframework.zip",
            checksum: "d2db5ae5dbc9c153c11a82cc88e306e01bdc450cf672c8b0f0794f7ebb0b723d"
        )
    ]
)
