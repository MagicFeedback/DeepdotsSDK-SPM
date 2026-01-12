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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.2/DeepdotsSDK-0.1.2.xcframework.zip",
            checksum: "3e33ad58cc5486ca56be64050602cfb309332a440d44e9e0052cd17ce80d89b0"
        )
    ]
)

