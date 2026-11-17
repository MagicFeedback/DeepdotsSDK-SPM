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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.12/DeepdotsSDK-0.7.12.xcframework.zip",
            checksum: "033226373b09faae6b3ff1f9c70ffa69c5d75bc8d9359e2fccad4ba03bfed859"
        )
    ]
)