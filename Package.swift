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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.11/DeepdotsSDK-0.7.11.xcframework.zip",
            checksum: "b5a4f2c92f99bc64888ed2f189a6f2cf9001e596a4d2e56fd2faf43f4f0d4e68"
        )
    ]
)