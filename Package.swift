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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.3.0/DeepdotsSDK-0.3.0.xcframework.zip",
            checksum: "9cccabcfd96ffb06e95e51a0690dd95e0707c90cc6fe72f6cfa350be80e5385f"
        )
    ]
)