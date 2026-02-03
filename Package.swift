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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.1.5/DeepdotsSDK-0.1.5.xcframework.zip",
            checksum: "ef46eddb5752d60623ebe5f500d71f2ead4cd4ae895b02dbcb822bc9f825b667"
        )
    ]
)
