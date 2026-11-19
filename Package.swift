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
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/0.7.13/DeepdotsSDK-0.7.13.xcframework.zip",
            checksum: "0c3495013bbfbec03a6d9816445aaf7149c23a5ecf7b6b0ec0985cf6c3eba95a"
        )
    ]
)