// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeepdotsSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "DeepdotsSDK",
            targets: ["DeepdotsSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "DeepdotsSDK",
            url: "https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/1.0.0/DeepdotsSDK-1.0.0.xcframework.zip",
            checksum: "0000000000000000000000000000000000000000000000000000000000000000"
        )
    ]
)
