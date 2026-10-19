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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.1/DeepdotsSDK-0.7.1.xcframework.zip",
            checksum: "fded508f1d93eeefb2035e9aa31b18dd2dfa937f7e4f3358182994466079d640"
        )
    ]
)